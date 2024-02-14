import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.0408),
          CommonTile(
            label: 'Upcoming Olympiads',
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
                controller.userAllOlympiadList.isEmpty
                    ? Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width * 0.102,
                        child: noUpcomingOlympiad())
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
    ));
  }
}
