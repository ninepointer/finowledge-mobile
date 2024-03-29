import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';
import 'package:uni_links/uni_links.dart';

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
        print('UniLinks Initial : $uri');
        if (uri != null) DeepLinkingServices.handelLinkRouting(uri);
        if (!mounted) return;
      } catch (e) {
        print('UniLinks Error : $e');
      }
    }
  }

  void _handleIncomingLinks() {
    StreamSubscription? sub;
    sub = uriLinkStream.listen((Uri? uri) {
      if (!mounted) return;
      print('UniLinks Incoming : $uri');
      if (uri != null) DeepLinkingServices.handelLinkRouting(uri);
    }, onError: (Object e) {
      if (!mounted) return;
      print('UniLinks Error : $e');
    });
  }

  void _handelInitialNotification() async {
    print('handelInitialNotification');
    RemoteMessage? initialMessage = await firebaseMessaging.getInitialMessage();
    print('handelInitialNotification : ${initialMessage?.toMap()}');
    if (initialMessage != null)
      NotificationServices.handelNotificationClick(
        initialMessage.data,
        isLocal: true,
      );
  }

  void _updateTab(int index) {
    controller.selectedIndex.value = index;

    switch (index) {
      case 0:
        Get.find<HomeController>().loadData();

        Get.find<WalletController>().getWalletTransactionsList();

        break;
      case 1:
        // Get.find<VirtualTradingController>().loadData();
        //   break;
        // case 2:
        //   Get.find<TenxTradingController>().loadData();
        break;
      case 3:
        // Get.find<MarginXController>().loadData();
        break;
      case 4:
        // Blank
        break;
      default:
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened) controller.userDetails(AppStorage.getUserDetails());
      },
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: AppStyles.tsGreyRegular12,
                ),
                Text(
                  controller.userDetailsData.studentName?.capitalizeFirst ??
                      '-',
                  style: Theme.of(context).textTheme.tsMedium16,
                ),
              ],
            ),
          ],
        ),
        actions: [
          // IconButton(
          //   splashRadius: 24,
          //   icon: Icon(Icons.person),
          //   onPressed: () => Get.toNamed(AppRoutes.profile),
          // ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.profile),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                    // color: AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.grey.withOpacity(.3),
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 20, // Adjust the radius as needed
                    backgroundColor: AppColors.white.withOpacity(1),
                    child: ClipOval(
                      child: controller.userDetails.value.profilePhoto?.url ==
                              null
                          ? Image.asset(
                              Get.isDarkMode
                                  ? AppImages.darkAppLogo
                                  : AppImages.lightAppLogo,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              controller.userDetails.value.profilePhoto?.url ??
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
      // floatingActionButton: FloatingActionButton(
      //   elevation: 0,
      //   backgroundColor:
      //       Get.isDarkMode ? AppColors.darkGreen : AppColors.lightGreen,
      //   onPressed: () => _updateTab(2),
      //   child: Icon(
      //     Icons.currency_rupee_rounded,
      //     color: AppColors.white,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: Obx(
      //   () => BottomAppBar(
      //     shape: CircularNotchedRectangle(),
      //     notchMargin: 4,
      //     child: Container(
      //       height: 60,
      //       margin: EdgeInsets.all(0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           _buildTabButton(
      //             context,
      //             index: 0,
      //             label: 'Home',
      //             icon: Icons.bar_chart_rounded,
      //           ),
      //           _buildTabButton(
      //             context,
      //             index: 1,
      //             label: 'Market',
      //             icon: Icons.analytics_rounded,
      //           ),
      //           SizedBox(width: 40),
      //           _buildTabButton(
      //             context,
      //             index: 3,
      //             label: 'MarginX',
      //             icon: Icons.trending_up_rounded,
      //           ),
      //           _buildTabButton(
      //             context,
      //             index: 4,
      //             label: 'TestZone',
      //             icon: Icons.groups_rounded,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Expanded _buildTabButton(
    BuildContext context, {
    required int index,
    required String label,
    required IconData icon,
  }) {
    return Expanded(
      child: MaterialButton(
        minWidth: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: controller.selectedIndex.value == index
                  ? Get.isDarkMode
                      ? AppColors.darkGreen
                      : AppColors.lightGreen
                  : AppColors.grey,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.tsRegular11.copyWith(
                    color: controller.selectedIndex.value == index
                        ? Get.isDarkMode
                            ? AppColors.darkGreen
                            : AppColors.lightGreen
                        : AppColors.grey,
                  ),
            )
          ],
        ),
        onPressed: () => _updateTab(index),
      ),
    );
  }
}
