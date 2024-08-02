import 'package:edge_pro/core/app/app_providers.dart';
import 'package:edge_pro/core/app/service_initializer.dart';
import 'package:edge_pro/core/app_router/app_router.dart';
import 'package:edge_pro/module/user/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesInitializer().initializeSettings();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      designSize: const Size(412, 915),
      builder: (_, child) {
        return MultiBlocProvider(
          providers: providers,
          child:  GetMaterialApp(
            navigatorKey: AppRouter.navigatorKey,
            title: 'Edge Pro',
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
