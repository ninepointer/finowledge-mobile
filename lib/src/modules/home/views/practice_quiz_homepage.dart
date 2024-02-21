import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';
import 'package:stoxhero/src/core/core.dart';

class PracticeQuizHomeView extends StatefulWidget {
  const PracticeQuizHomeView({super.key});

  @override
  State<PracticeQuizHomeView> createState() => _PracticeQuizHomeViewState();
}

class _PracticeQuizHomeViewState extends State<PracticeQuizHomeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  "Open Quiz",
                  style: Get.isDarkMode
                      ? AppStyles.tsWhiteMedium14
                      : AppStyles.tsBlackMedium14,
                ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          elevation: 3,
          clipBehavior: Clip.none,
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Banking Quiz",
                        style: Get.isDarkMode
                            ? AppStyles.tsWhiteMedium16
                            : AppStyles.tsBlackMedium16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "20 Qs.",
                          style: Get.isDarkMode
                              ? AppStyles.tsWhiteRegular12
                              : AppStyles.tsBlackRegular12,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "12 mins.",
                          style: Get.isDarkMode
                              ? AppStyles.tsWhiteRegular12
                              : AppStyles.tsBlackRegular12,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '40 Marks',
                          style: Get.isDarkMode
                              ? AppStyles.tsWhiteRegular12
                              : AppStyles.tsBlackRegular12,
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => DisclaimerPage());
                      },
                      child: Text(
                        "Start Quiz",
                        style: Get.isDarkMode
                            ? AppStyles.tsBlackMedium14
                                .copyWith(color: AppColors.primary)
                            : AppStyles.tsBlackMedium14.copyWith(
                                color: AppColors.finowledgePurpleAccentColors,
                              ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
