import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../app/app.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late HomeController controller;

  late ReferralsController referralsController;

  @override
  void initState() {
    super.initState();

    controller = Get.find<HomeController>();
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
                    horizontal: MediaQuery.of(context).size.width * 0.0510,
                    vertical: MediaQuery.of(context).size.width * 0.0510),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0102),
                    CommonTile(
                      label: 'My Olympiads',
                      showSeeAllButton: false,
                      // isValue: true,
                      // seeAllLabel: 'View All',
                      value: "",
                      onPressed: () {},
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0408),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       controller.myActiveOlympiadList.isEmpty
                    //           ? Container()
                    //           : Obx(
                    //               () => Row(
                    //                 children: controller.myActiveOlympiadList
                    //                     .map((contest) {
                    //                   String userId =
                    //                       controller.userDetailsData.sId ?? '';
                    //                   return Container(
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
                    //                                 0.1403,
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Flexible(
                        child: Text(
                          "You have not participated in any finance olympiads yet.",
                          style: AppStyles.tsBlackMedium14,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0408),
                    CommonTile(
                      label: 'Upcoming Olympiads',
                      showSeeAllButton: false,
                      value: "",
                      onPressed: () {},
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0408),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          controller.myActiveOlympiadList.isEmpty
                              ? noOlympiad()
                              : Obx(
                                  () => Row(
                                    children: controller.myActiveOlympiadList
                                        .map((contest) {
                                      String userId =
                                          controller.userDetailsData.sId ?? '';
                                      return Container(
                                        width: controller.myActiveOlympiadList
                                                    .length ==
                                                1
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.102
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1403,
                                        child: OlympiadCard(
                                          //userId: userId,
                                          myOlympiad: contest,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
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
        color: Colors.blue, // Change the color as needed
      ),
      child: Text(
        'Sorry, You don\'t have any finance olympiad, keep checking this space!',
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
