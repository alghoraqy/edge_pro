import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:edge_pro/core/constants/shared_pref_keys.dart';
import 'package:edge_pro/core/errors/exceptions.dart';
import 'package:edge_pro/module/user/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocaleDataSource {
  final SharedPreferences sharedPreferences;
  UserLocaleDataSource({required this.sharedPreferences});

  Future<Unit> cacheUser({required User user}) async {
    final userJson = json.encode(user.toJson());
    await sharedPreferences.setString(SharedPrefKeys.cachedUser, userJson);
    return Future.value(unit);
  }

  Future<User> getCachedUser() {
    final jsonString = sharedPreferences.getString(SharedPrefKeys.cachedUser);
    if (jsonString != null) {
      final decodedJsonData = json.decode(jsonString);
      User user = User.fromJson(decodedJsonData);
      return Future.value(user);
    } else {
      throw EmptyCashException();
    }
  }

  Future<Unit> removeCachedUser() async {
    await sharedPreferences.remove(SharedPrefKeys.cachedUser);
    return Future.value(unit);
  }
}
