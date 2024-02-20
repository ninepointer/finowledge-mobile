import 'package:flutter/material.dart';
import '../../../app/app.dart';
import '../../../utils/common_utils.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    controller = Get.find<HomeController>();
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            controller.loadData();
            return Future.value();
          },
          child: Visibility(
            visible: !controller.isLoadingStatus,
            replacement: DashboardShimmer(),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.0408,
                    vertical: MediaQuery.of(context).size.width * 0.0408),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          Container(
                            color: Get.isDarkMode
                                ? AppColors.darkScaffoldBackgroundColor
                                : AppColors.whiteScreenBackgroundColors,
                            child: TabBar(
                              onTap: (index) {
                                controller.loadData();
                                controller.selectedTabIndex.value = index;
                              },
                              padding: EdgeInsets.zero,
                              isScrollable: true,
                              controller: tabController,
                              indicatorColor: Get.isDarkMode
                                  ? AppColors.black
                                  : AppColors.white,
                              labelColor: AppColors.white,
                              unselectedLabelColor: Get.isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              indicator: BoxDecoration(
                                color: AppColors.finowledgePurpleAccentColors,
                                borderRadius:
                                    BorderRadius.circular(40), // Border radius
                              ),
                              tabs: [
                                Tab(
                                  child: Text(
                                    string("label_upcoming"),
                                    style:
                                        Theme.of(context).textTheme.tsRegular14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    string("label_my_olympiad"),
                                    style:
                                        Theme.of(context).textTheme.tsRegular14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    string("label_completed"),
                                    style:
                                        Theme.of(context).textTheme.tsRegular14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    string("label_practice"),
                                    style:
                                        Theme.of(context).textTheme.tsRegular14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(() {
                            if (controller.selectedTabIndex.value == 0) {
                              return UpcomingOlympiadView();
                            } else if (controller.selectedTabIndex.value == 1) {
                              return ActiveOlympiadView();
                            } else if (controller.selectedTabIndex.value == 2) {
                              return comingSoonViewWithLottie(
                                string(
                                  "label_coming_soon_text",
                                ),
                              );
                            } else {
                              return comingSoonViewWithLottie(
                                  string("label_coming_soon_text"));
                            }
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
