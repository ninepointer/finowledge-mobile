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
          height: 20,
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
                        style: AppStyles.tsBlackMedium16,
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
                          style: AppStyles.tsBlackRegular14,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "12 mins.",
                          style: AppStyles.tsBlackRegular14,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '40 Marks',
                          style: AppStyles.tsBlackRegular14,
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => DisclaimerPage());
                      },
                      child: Text(
                        "Start Quiz",
                        style: AppStyles.tsBlackMedium14.copyWith(
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
