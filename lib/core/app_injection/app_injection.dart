import 'package:edge_pro/core/network/network_checker.dart';
import 'package:edge_pro/module/user/data/data_source/user_local_data_source.dart';
import 'package:edge_pro/module/user/data/repository/user_repository.dart';
import 'package:edge_pro/module/user/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

var sl = GetIt.instance;

class DependencyInjectionServices {
  static Future<void> diInit() async {
    // Blocs
    sl.registerFactory(() => UserBloc(userRepository: sl()));

    //  Repository
    sl.registerLazySingleton(
      () => UserRepository(localDataSource: sl(), networkChecker: sl()),
    );

    // DataSources
    sl.registerLazySingleton<UserLocaleDataSource>(
        () => UserLocaleDataSource(sharedPreferences: sl()));

    /// core
    sl.registerLazySingleton<NetworkChecker>(
        () => NetworkCheckerImpl(connectionChecker: sl()));

    /// External
    sl.registerLazySingleton(() => InternetConnectionChecker());

    await sharedPrefInit();
  }

    static Future<void> sharedPrefInit() async {
    final sharedPref = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPref);
  }
}
