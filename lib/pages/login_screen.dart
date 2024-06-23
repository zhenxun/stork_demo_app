import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stork_demo_app/controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: '886',
    countryCode: 'TW',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: '臺灣',
    example: "臺灣",
    displayName: "臺灣",
    displayNameNoCountryCode: "TW",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
              const Text("登入帳號", style: TextStyle(fontSize: 20)),
              const Gap(15),
              Text(
                "陪你勇敢到最後 · 愛與希望的守護者",
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.black38,
                  letterSpacing: 2.0,
                ),
              ),
              const Gap(15),
              TextFormField(
                controller: phoneController,
                onChanged: (value) {
                  phoneController.text = value;
                },
                decoration: InputDecoration(
                    hintText: "請輸入手機號碼",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue.shade100),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 500,
                            ),
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                          );
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    String phone =
                        "+${selectedCountry.phoneCode}${phoneController.value.text}";
                    print("send phone $phone");
                    await loginController.login(phone);
                    Get.toNamed("/qrcode");
                  },
                  child: const Text(
                    "登入",
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
      )),
    );
  }
}
