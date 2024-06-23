import 'package:get/get.dart';
import 'package:stork_demo_app/controllers/auth_controller.dart';
import 'package:stork_demo_app/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(LoginController());
  }
}
