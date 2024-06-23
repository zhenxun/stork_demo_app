import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stork_demo_app/pages/widgets/bottom_app_bar_item.dart';
import 'package:stork_demo_app/utils/constant.dart';

import '../l10n/gen_l10n/app_localizations.dart';

class QrcodeScreen extends StatefulWidget {
  const QrcodeScreen({super.key});

  @override
  State<QrcodeScreen> createState() => _QrcodeScreenState();
}

class _QrcodeScreenState extends State<QrcodeScreen> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined, color: Colors.white),
          onPressed: () => Get.toNamed('/'),
        ),
        title: const Text("我的條碼"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        surfaceTintColor: kPrimaryColor,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(13.0, 0, 13.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomAppBarItem(
                title:
                    AppLocalizations.of(context)!.bottomAppBarItemReservation,
                icon: const Icon(Icons.calendar_month, color: Colors.white),
                onTap: () {},
              ),
              BottomAppBarItem(
                title: AppLocalizations.of(context)!
                    .bottomAppBarItemMedicalConsultationProgress,
                icon: const FaIcon(FontAwesomeIcons.barsProgress,
                    color: Colors.white),
                onTap: () {},
              ),
              BottomAppBarItem(
                title: AppLocalizations.of(context)!.bottomAppBarItemTodoList,
                icon: const FaIcon(FontAwesomeIcons.listCheck,
                    color: Colors.white),
                onTap: () {},
              ),
              BottomAppBarItem(
                title:
                    AppLocalizations.of(context)!.bottomAppBarItemExamineReport,
                icon: const FaIcon(FontAwesomeIcons.fileContract,
                    color: Colors.white),
                onTap: () {},
              ),
              BottomAppBarItem(
                title: AppLocalizations.of(context)!.bottomAppBarItemCellInfo,
                icon: const FaIcon(FontAwesomeIcons.bomb, color: Colors.white),
                onTap: () {},
              ),
              BottomAppBarItem(
                title: AppLocalizations.of(context)!.bottomAppBarItemFee,
                icon: const Icon(Icons.attach_money, color: Colors.white),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Gap(35),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      spreadRadius: 3.0,
                      offset: Offset(5.0, 5.0),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/stork_baby_egg.png',
                      width: 35.0,
                      height: 35.0,
                    ),
                    const Text("蛋寶集點趣"),
                    const Spacer(),
                    const Text(
                      "145",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(25),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "折抵點數",
                      style: TextStyle(
                        letterSpacing: 2.0,
                      ),
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: light,
                      activeColor: kPrimaryColor,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          light = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Gap(25),
            QrImageView(
              data: '1234567890',
              version: 10,
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
