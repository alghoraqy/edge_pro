import 'package:edge_pro/core/app_injection/app_injection.dart';
import 'package:edge_pro/core/app_router/app_router.dart';
import 'package:edge_pro/core/constants/app_colors.dart';
import 'package:edge_pro/core/network/network_checker.dart';
import 'package:edge_pro/module/user/presentation/bloc/user_bloc.dart';
import 'package:edge_pro/module/user/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    sl<NetworkChecker>().hasConnection.listen((networkConnection) {
      if (networkConnection == InternetConnectionStatus.connected) {
        if (UserBloc.of(AppRouter.currentContext).currentUser != null) {
          UserBloc.of(AppRouter.currentContext).add(CallApiEvent());
        }
        debugPrint('Connected');
      } else if (networkConnection == InternetConnectionStatus.disconnected) {
        debugPrint('DisConnected');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () async {
          AppRouter.to(const ProfileScreen());
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: AppColors.primary,
          minWidth: 200.w,
          child: Text(
            'Profile',
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
