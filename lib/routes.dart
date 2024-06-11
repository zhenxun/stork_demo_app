import 'package:get/get.dart';
import 'package:stork_demo_app/pages/home_screen.dart';

class Routes {
  static const String home = '/';

  static final List<GetPage<dynamic>> getPages = [
    GetPage(name: home, page: () => const HomeScreen()),
  ];
}
