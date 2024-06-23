import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:stork_demo_app/controllers/login_controller.dart';
import 'package:stork_demo_app/pages/widgets/bottom_app_bar_item.dart';
import 'package:stork_demo_app/pages/widgets/drawer_item.dart';
import 'package:stork_demo_app/pages/widgets/recommend_article.dart';
import 'package:stork_demo_app/pages/widgets/ticket_viewer.dart';
import 'package:stork_demo_app/utils/constant.dart';
import '../l10n/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    FlutterNativeSplash.remove();
    loginController.authController.authState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
            iconSize: 15.0,
            onPressed: () async {
              if (loginController.authController.authenticated) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.question,
                  animType: AnimType.rightSlide,
                  title: "登出",
                  desc: "確定要登出嗎?",
                  btnOkText: "登出",
                  btnCancelText: "取消",
                  btnCancelOnPress: () {},
                  btnOkOnPress: () async {
                    await loginController.logout();
                  },
                ).show();
              } else {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.question,
                  animType: AnimType.rightSlide,
                  title: "尚未登入",
                  btnOkText: "登入",
                  btnCancelText: "取消",
                  btnCancelOnPress: () {},
                  btnOkOnPress: () async {
                    Get.toNamed('/login');
                  },
                ).show();
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 80.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "${AppLocalizations.of(context)!.drawerVersion} 1.0.0",
                style: const TextStyle(
                  fontSize: 13.0,
                  letterSpacing: 3.0,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            DrawerItem(
              title: AppLocalizations.of(context)!.drawerMenuItemIndex,
              icon: const Icon(Icons.home, color: kPrimaryColor),
              onTap: () {},
            ),
            DrawerItem(
              title: AppLocalizations.of(context)!.drawerMenuItemMedicalCenter,
              icon: const Icon(Icons.medical_services, color: kPrimaryColor),
              onTap: () {},
            ),
            DrawerItem(
              title:
                  AppLocalizations.of(context)!.drawerMenuItemHealthEducation,
              icon: const Icon(Icons.book, color: kPrimaryColor),
              onTap: () {},
            ),
            DrawerItem(
              title:
                  AppLocalizations.of(context)!.drawerMenuItemCustomerService,
              icon: const Icon(Icons.support_agent, color: kPrimaryColor),
              onTap: () {},
            ),
            DrawerItem(
              title:
                  AppLocalizations.of(context)!.drawerMenuItemPersonalSetting,
              icon: const Icon(Icons.settings, color: kPrimaryColor),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/qrcode"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.transparent,
            width: 2.0,
          ),
        ),
        mini: false,
        child: Image.asset(
          'assets/images/stork_baby_egg.png',
          width: 48.0,
          height: 48.0,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        surfaceTintColor: kPrimaryColor,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(13.0, 0, 13.0, 0),
          child: Row(
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
              const Spacer(),
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
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 45.0,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                  ),
                  items: [1, 2].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(
                            "assets/images/slide$i.png",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.goodMorning,
                          style: const TextStyle(
                              fontSize: 18.0,
                              letterSpacing: 3.0,
                              color: Color(0xFF8b8c89),
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "測試人員",
                          style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 3.0,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.bell),
                          onPressed: () {
                            // Handle button press
                          },
                        ),
                        Positioned(
                          top: 12,
                          right: 14,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Gap(15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xFFF4F6FD),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 5.0,
                  ),
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 15.0,
                        color: Color(0xFFced4da),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.search,
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                              letterSpacing: 3.0,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.upcoming,
                      style: const TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 3.0,
                        color: Color(0xFF6c757d),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.viewAll,
                      style: const TextStyle(
                        fontSize: 14.0,
                        letterSpacing: 3.0,
                        color: Color(0xFFadb5bd),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      TicketViewer(),
                      TicketViewer(),
                    ],
                  ),
                ),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.recommendArticle,
                      style: const TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 3.0,
                        color: Color(0xFF6c757d),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.viewAll,
                      style: const TextStyle(
                        fontSize: 14.0,
                        letterSpacing: 3.0,
                        color: Color(0xFFadb5bd),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      RecommendArticle(
                          title: "免疫媽媽克服關鍵兇手 成功帶回雙寶",
                          image: "assets/images/article1.png"),
                      RecommendArticle(
                          title: "運用AI人工智慧 以胚胎照片預測試管嬰兒成功率",
                          image: "assets/images/article2.png"),
                      RecommendArticle(
                          title: "凍卵，等一個人",
                          image: "assets/images/article3.png"),
                    ],
                  ),
                ),
                const Gap(30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
