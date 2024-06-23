import 'package:get/get.dart';
import 'package:stork_demo_app/middleware/app_middleware.dart';
import 'package:stork_demo_app/pages/home_screen.dart';
import 'package:stork_demo_app/pages/login_screen.dart';
import 'package:stork_demo_app/pages/opt_screen.dart';
import 'package:stork_demo_app/pages/qrcode_screen.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String qrcode = '/qrcode';
  static const String optScreen = '/optScreen';

  static final List<GetPage<dynamic>> getPages = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      middlewares: [AppMiddleware()],
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      middlewares: [AppMiddleware()],
    ),
    GetPage(
      name: qrcode,
      page: () => const QrcodeScreen(),
      middlewares: [AppMiddleware()],
    ),
    GetPage(
      name: optScreen,
      page: () => const OptScreen(),
      middlewares: [AppMiddleware()],
    )
  ];
}
