import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.0408),
          CommonTile(
            label: 'My Olympiads',
            showSeeAllButton: false,
            value: "",
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.0408),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            physics: AlwaysScrollableScrollPhysics(),
            child: Row(
              children: [
                controller.myActiveOlympiadList.isEmpty
                    ? Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width * 0.102,
                        child: noUpcomingOlympiad())
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
    ));
  }
}
