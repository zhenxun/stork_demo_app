import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stork_demo_app/controllers/auth_controller.dart';

class AppMiddleware extends GetMiddleware {
  final authController = Get.find<AuthController>();

  @override
  RouteSettings? redirect(String? route) {
    print('>>> RouteSettings called with: ${route.toString()}');
    return authController.authenticated ||
            route == '/login' ||
            route == '/' ||
            route == '/optScreen'
        ? null
        : const RouteSettings(name: '/login');
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    print('>>> onPageCalled Page ${page?.name} called');
    print('>>> onPageCalled User ${authController.currentUser} logged');
    print('>>> authState current user uid =  ${authController.currentUserUid}');
    return authController.currentUser != null
        ? page?.copy(arguments: authController.currentUser)
        : page;
  }

  @override
  GetPageBuilder onPageBuildStart(GetPageBuilder? page) {
    print('Bindings of ${page.toString()} are ready');
    return page!;
  }

  @override
  Widget onPageBuilt(Widget page) {
    print('onPageBuilt Widget ${page.toStringShort()} will be showed');
    return page;
  }

  @override
  void onPageDispose() {
    print('PageDisposed');
  }
}
