
import 'package:edge_pro/core/app_injection/app_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';

class ServicesInitializer {
  Future initializeSettings() async {
    Bloc.observer = MyBlocObserver();
    await DependencyInjectionServices.diInit();
  }

  // Future getDataFromShared() async {
  //   AppConstants.appVersion = await sl<SharedPreferencesServices>().getData(
  //         key: SharedPrefKeys.appVersion,
  //         dataType: DataType.string,
  //       ) ??
  //       '';
  // }
}
