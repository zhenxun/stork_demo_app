import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:stork_demo_app/controllers/login_controller.dart';

class OptScreen extends StatefulWidget {
  const OptScreen({super.key});

  @override
  State<OptScreen> createState() => _OptScreenState();
}

class _OptScreenState extends State<OptScreen> {
  String? optCode;

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade50,
                  ),
                  child: Image.asset('assets/images/image1.png'),
                ),
                const Gap(15),
                const Text("驗證碼認證", style: TextStyle(fontSize: 20)),
                const Gap(15),
                Text(
                  "請輸入傳送至您手機的驗證碼",
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.black38,
                    letterSpacing: 2.0,
                  ),
                ),
                const Gap(15),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blue.shade500,
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (String pin) {
                    setState(() {
                      optCode = pin;
                    });
                  },
                ),
                const Gap(15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (optCode != null) {
                        await loginController.verifySendCode(optCode!);
                      }
                    },
                    child: const Text(
                      "確認",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
