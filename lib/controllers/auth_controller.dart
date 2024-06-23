import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _authenticated = false.obs;
  final _currentUser = Rx<User?>(null);
  final _currentUserUid = RxString("");
  final _verificationId = RxString("");
  final _resendToken = RxInt(0);

  bool get authenticated => _authenticated.value;
  set authenticated(bool value) => _authenticated.value = value;
  User? get currentUser => _currentUser.value;
  set currentUser(User? value) => _currentUser.value = value;
  String get currentUserUid => _currentUserUid.value;
  set currentUserUid(String value) => _currentUserUid.value = value;
  String get verificationId => _verificationId.value;
  set verificationId(String value) => _verificationId.value = value;
  int get resendToken => _resendToken.value;
  set resendToken(int value) => _resendToken.value = value;

  @override
  void onInit() {
    ever(_authenticated, (value) {
      if (value) {
        Get.offAllNamed("/home");
      }
    });
    super.onInit();
  }

  void authState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        authenticated = false;
      } else {
        authenticated = true;
        currentUser = user;
        currentUserUid = user.uid;
      }
    });
  }
}
