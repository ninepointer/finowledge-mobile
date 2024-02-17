import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stoxhero/src/app/app.dart';
import 'package:stoxhero/src/core/utils/app_lottie.dart';

import '../../../utils/common_utils.dart';

class ActiveOlympiadView extends StatefulWidget {
  const ActiveOlympiadView({super.key});

  @override
  State<ActiveOlympiadView> createState() => _ActiveOlympiadViewState();
}

class _ActiveOlympiadViewState extends State<ActiveOlympiadView> {
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
          controller.myActiveOlympiadList.isNotEmpty
              ? CommonTile(
                  label: string("label_my_olympiad"),
                  showSeeAllButton: false,
                  value: "",
                  margin: EdgeInsets.only(left: 8),
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
                controller.myActiveOlympiadList.isEmpty
                    ? Column(
                        children: [
                          Lottie.asset(AppLottie.emptyView),
                          Container(
                              width: MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 0.102,
                              child: emptyOlympiadText(
                                  string("label_no_my_olympiad"))),
                        ],
                      )
                    : Obx(
                        () => Row(
                          children:
                              controller.myActiveOlympiadList.map((contest) {
                            String userId =
                                controller.userDetailsData.sId ?? '';
                            return Container(
                              margin: EdgeInsets.only(
                                  right:
                                      controller.myActiveOlympiadList.length ==
                                              1
                                          ? 0
                                          : MediaQuery.of(context).size.width *
                                              0.0408),
                              width: controller.myActiveOlympiadList.length == 1
                                  ? MediaQuery.of(context).size.width -
                                      MediaQuery.of(context).size.width * 0.102
                                  : MediaQuery.of(context).size.width -
                                      MediaQuery.of(context).size.width *
                                          0.1603,
                              child: ActiveOlympiadCard(
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
