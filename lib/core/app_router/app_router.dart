import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? currentContext = navigatorKey.currentContext;

  static to(Widget page, {Transition? transition}) => Get.to(
        page,
        transition: transition ?? Transition.rightToLeft,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );

  static off(Widget page,{Transition? transition}) => Get.off(
        page,
        transition:  transition ?? Transition.rightToLeft,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );

  static offAll(Widget page,{Transition? transition, int? milliseconds}) => Get.offAll(
        page,
        transition: transition ?? Transition.rightToLeft,
        duration:  Duration(milliseconds: milliseconds??400),
        curve: Curves.easeInOut,
      );

  static back() => Get.back();
}
