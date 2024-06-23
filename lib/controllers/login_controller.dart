import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stork_demo_app/controllers/auth_controller.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    print('>>> LoginController started');
    super.onInit();
  }

  AuthController get authController => Get.find<AuthController>();

  Future<void> login(String phone) async {
    try {
      return await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('>>> Error: $e');
        },
        codeSent: (String verificationId, int? resendToken) {
          print('>>> Code sent');

          authController.verificationId = verificationId;
          authController.resendToken = resendToken ?? 0;

          Get.toNamed("/optScreen");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
          Get.toNamed('/login');
        },
      );
    } catch (e) {
      print('>>> Error: $e');
    }
  }

  Future<void> verifySendCode(String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: authController.verificationId, smsCode: code);

    UserCredential authUser =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (authUser.user != null) {
      authController.currentUserUid = authUser.user!.uid;
      authController.authenticated = true;
      Get.toNamed('/qrcode');
    } else {
      Get.toNamed('/login');
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      Get.toNamed("/");
    } catch (e) {
      print('>>> Error: $e');
    }
  }
}
