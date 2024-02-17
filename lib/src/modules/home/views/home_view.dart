import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';
import 'package:uni_links/uni_links.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/common_utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController controller;

  Uri? initialUri;
  Uri? latestUri;
  bool _initialUriIsHandled = false;

  List<Widget> _tabs = [
    DashboardView(),
  ];

  @override
  void initState() {
    super.initState();
    _handleInitialUri();
    _handleIncomingLinks();
    _handelInitialNotification();
    controller = Get.find<HomeController>();
  }

  Future _handleInitialUri() async {
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      try {
        final uri = await getInitialUri();
        if (uri != null) DeepLinkingServices.handelLinkRouting(uri);
        if (!mounted) return;
      } catch (e) {}
    }
  }

  void _handleIncomingLinks() {
    StreamSubscription? sub;
    sub = uriLinkStream.listen((Uri? uri) {
      if (!mounted) return;
      if (uri != null) DeepLinkingServices.handelLinkRouting(uri);
    }, onError: (Object e) {
      if (!mounted) return;
    });
  }

  void _handelInitialNotification() async {
    RemoteMessage? initialMessage = await firebaseMessaging.getInitialMessage();
    if (initialMessage != null)
      NotificationServices.handelNotificationClick(
        initialMessage.data,
        isLocal: true,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened) controller.userDetails(AppStorage.getUserDetails());
      },
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFF9FCFF)),
        backgroundColor: AppColors.finowledgePurpleAccentColors,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.hand,
                      size: 14,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.0102,
                    ),
                    Text(
                      string("label_hello"),
                      style: AppStyles.tsGreyRegular14
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.0102,
                ),
                Text(
                  string("label_gear_you_up"),
                  style:
                      AppStyles.tsBlackRegular12.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.0204,
                )
              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.profile),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.grey.withOpacity(.3),
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 20, // Adjust the radius as needed
                    backgroundColor: AppColors.white.withOpacity(1),
                    child: ClipOval(
                      child: controller.userDetails.value.schoolDetails
                                  ?.profilePhoto ==
                              null
                          ? Image.asset(
                              Get.isDarkMode
                                  ? AppImages.darkAppLogo
                                  : AppImages.lightAppLogo,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              controller.userDetails.value.schoolDetails
                                      ?.profilePhoto ??
                                  '',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() => _tabs[controller.selectedIndex.value]),
    );
  }
}
