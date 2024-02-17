import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stoxhero/src/app/app.dart';

import '../../../core/utils/app_lottie.dart';
import '../../../utils/common_utils.dart';

class UpcomingOlympiadView extends StatefulWidget {
  const UpcomingOlympiadView({super.key});

  @override
  State<UpcomingOlympiadView> createState() => _UpcomingOlympiadViewState();
}

class _UpcomingOlympiadViewState extends State<UpcomingOlympiadView> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<HomeController>();
    controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.0408),
          controller.userAllOlympiadList.isNotEmpty
              ? CommonTile(
                  label: string("label_upcoming_olympiad"),
                  showSeeAllButton: false,
                  value: "",
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                )
              : SizedBox(),
          SizedBox(height: MediaQuery.of(context).size.width * 0.0408),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            physics: AlwaysScrollableScrollPhysics(),
            child: Row(
              children: [
                controller.userAllOlympiadList.isEmpty
                    ? Column(
                        children: [
                          Lottie.asset(AppLottie.emptyView),
                          Container(
                              width: MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 0.102,
                              child: emptyOlympiadText(
                                  string("label_no_upcoming_olympiad"))),
                        ],
                      )
                    : Obx(
                        () => Row(
                          children:
                              controller.userAllOlympiadList.map((contest) {
                            String userId =
                                controller.userDetailsData.sId ?? '';
                            return Container(
                              margin: EdgeInsets.only(
                                  right:
                                      controller.userAllOlympiadList.length == 1
                                          ? 0
                                          : MediaQuery.of(context).size.width *
                                              0.0408),
                              width: controller.userAllOlympiadList.length == 1
                                  ? MediaQuery.of(context).size.width -
                                      MediaQuery.of(context).size.width * 0.102
                                  : MediaQuery.of(context).size.width -
                                      MediaQuery.of(context).size.width *
                                          0.1603,
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
    );
  }
}
