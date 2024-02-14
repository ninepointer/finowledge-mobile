import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../app/app.dart';

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
                            color: AppColors.white,
                            child: TabBar(
                              padding: EdgeInsets.zero,
                              isScrollable: true,
                              controller: tabController,
                              indicatorColor: AppColors.white,
                              labelColor: AppColors.white,
                              unselectedLabelColor: AppColors.primary,
                              indicator: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius:
                                    BorderRadius.circular(40), // Border radius
                              ),
                              tabs: [
                                Tab(
                                  child: Text(
                                    'Upcoming',
                                    style:
                                        Theme.of(context).textTheme.tsRegular14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'My Olympiad',
                                    style:
                                        Theme.of(context).textTheme.tsRegular14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Completed',
                                    style:
                                        Theme.of(context).textTheme.tsRegular14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Practice',
                                    style:
                                        Theme.of(context).textTheme.tsRegular14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 12,
                          // ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 700,
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                Container(child: UpcomingOlympiadView()),
                                Container(child: ActiveOlympiadView()),
                                Container(child: noUpcomingOlympiad()),
                                Container(child: noOlympiad()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Get.to(() => MainDashBoardView());
                    //     },
                    //     child: Text("page")),
                    // SizedBox(
                    //     height: MediaQuery.of(context).size.width * 0.0102),
                    // CommonTile(
                    //   label: 'My Olympiads',
                    //   showSeeAllButton: false,
                    //   // isValue: true,
                    //   // seeAllLabel: 'View All',
                    //   value: "",
                    //   onPressed: () {},
                    //   margin: EdgeInsets.zero,
                    //   padding: EdgeInsets.zero,
                    // ),
                    // SizedBox(
                    //     height: MediaQuery.of(context).size.width * 0.0408),
                    // SingleChildScrollView(
                    //   clipBehavior: Clip.none,
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       controller.myActiveOlympiadList.isEmpty
                    //           ? Container(
                    //               width: MediaQuery.of(context).size.width -
                    //                   MediaQuery.of(context).size.width * 0.102,
                    //               child: noOlympiad(),
                    //             )
                    //           : Obx(
                    //               () => Row(
                    //                 children: controller.myActiveOlympiadList
                    //                     .map((contest) {
                    //                   String userId =
                    //                       controller.userDetailsData.sId ?? '';
                    //                   return Container(
                    //                     margin: EdgeInsets.only(
                    //                         right: MediaQuery.of(context)
                    //                                 .size
                    //                                 .width *
                    //                             0.0408),
                    //                     width: controller.myActiveOlympiadList
                    //                                 .length ==
                    //                             1
                    //                         ? MediaQuery.of(context)
                    //                                 .size
                    //                                 .width -
                    //                             MediaQuery.of(context)
                    //                                     .size
                    //                                     .width *
                    //                                 0.102
                    //                         : MediaQuery.of(context)
                    //                                 .size
                    //                                 .width -
                    //                             MediaQuery.of(context)
                    //                                     .size
                    //                                     .width *
                    //                                 0.1603,
                    //                     child: ActiveOlympiadCard(
                    //                       //userId: userId,
                    //                       myOlympiad: contest,
                    //                     ),
                    //                   );
                    //                 }).toList(),
                    //               ),
                    //             ),
                    //     ],
                    //   ),
                    // ),
                    // // Container(
                    // //   width: MediaQuery.of(context).size.width,
                    // //   child: Flexible(
                    // //     child: Text(
                    // //       "You have not participated in any finance olympiads yet.",
                    // //       style: AppStyles.tsBlackMedium14,
                    // //     ),
                    // //   ),
                    // // ),

                    // SizedBox(
                    //     height: MediaQuery.of(context).size.width * 0.0408),
                    // CommonTile(
                    //   label: 'Upcoming Olympiads',
                    //   showSeeAllButton: false,
                    //   value: "",
                    //   onPressed: () {},
                    //   margin: EdgeInsets.zero,
                    //   padding: EdgeInsets.zero,
                    // ),
                    // SizedBox(
                    //     height: MediaQuery.of(context).size.width * 0.0408),
                    // SingleChildScrollView(
                    //   clipBehavior: Clip.none,
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       controller.userAllOlympiadList.isEmpty
                    //           ? Container(
                    //               width: MediaQuery.of(context).size.width -
                    //                   MediaQuery.of(context).size.width * 0.102,
                    //               child: noUpcomingOlympiad())
                    //           : Obx(
                    //               () => Row(
                    //                 children: controller.userAllOlympiadList
                    //                     .map((contest) {
                    //                   String userId =
                    //                       controller.userDetailsData.sId ?? '';
                    //                   return Container(
                    //                     margin: EdgeInsets.only(
                    //                         right: MediaQuery.of(context)
                    //                                 .size
                    //                                 .width *
                    //                             0.0408),
                    //                     width: controller.userAllOlympiadList
                    //                                 .length ==
                    //                             1
                    //                         ? MediaQuery.of(context)
                    //                                 .size
                    //                                 .width -
                    //                             MediaQuery.of(context)
                    //                                     .size
                    //                                     .width *
                    //                                 0.102
                    //                         : MediaQuery.of(context)
                    //                                 .size
                    //                                 .width -
                    //                             MediaQuery.of(context)
                    //                                     .size
                    //                                     .width *
                    //                                 0.1603,
                    //                     child: OlympiadCard(
                    //                       //userId: userId,
                    //                       myOlympiad: contest,
                    //                     ),
                    //                   );
                    //                 }).toList(),
                    //               ),
                    //             ),
                    //     ],
                    //   ),
                    // ),
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

Widget noOlympiad() {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.grey, // Change the color as needed
      ),
      child: Text(
        'You have not participated in any finance olympiads yet.',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Change the text color as needed
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget noUpcomingOlympiad() {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.grey, // Change the color as needed
      ),
      child: Text(
        'No upcoming finance olympiad, keep checking this space!',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Change the text color as needed
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
