import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';

class DisclaimerPage extends StatefulWidget {
  const DisclaimerPage({super.key});

  @override
  State<DisclaimerPage> createState() => _DisclaimerPageState();
}

class _DisclaimerPageState extends State<DisclaimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Quiz"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Banking Quiz',
                    style: Get.isDarkMode
                        ? AppStyles.tsWhiteMedium18
                        : AppStyles.tsBlackMedium18,
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Duration: 12 Mins",
                    style: Get.isDarkMode
                        ? AppStyles.tsWhiteMedium14
                        : AppStyles.tsBlackMedium14,
                  ),
                  Text(
                    "Maximum Marks: 40",
                    style: Get.isDarkMode
                        ? AppStyles.tsWhiteMedium14
                        : AppStyles.tsBlackMedium14,
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  // Icon(
                  //   Icons.circle,
                  //   size: 6,
                  // ),
                  // SizedBox(
                  //   width: 4,
                  // ),
                  Flexible(
                    child: Text(
                      '- The quiz consists of a total of 20 questions.',
                      style: Get.isDarkMode
                          ? AppStyles.tsWhiteRegular16
                          : AppStyles.tsBlackRegular16,
                    ),
                  ),
                ],
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon(
                  //   Icons.circle,
                  //   size: 6,
                  // ),
                  // SizedBox(
                  //   width: 4,
                  // ),
                  Flexible(
                    child: Text(
                      '- Each question has 4 options out of which only one is correct.',
                      style: Get.isDarkMode
                          ? AppStyles.tsWhiteRegular16
                          : AppStyles.tsBlackRegular16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // Icon(
                  //   Icons.circle,
                  //   size: 6,
                  // ),
                  // SizedBox(
                  //   width: 4,
                  // ),
                  Flexible(
                    child: Text(
                      '- You have to finish the test in 12 minutes.',
                      style: Get.isDarkMode
                          ? AppStyles.tsWhiteRegular16
                          : AppStyles.tsBlackRegular16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // Icon(
                  //   Icons.circle,
                  //   size: 6,
                  // ),
                  // SizedBox(
                  //   width: 4,
                  // ),
                  Flexible(
                    child: Text(
                      '- You will be awarded 2 marks for each correct answer and 0.5 will be deducted for each wrong answer.',
                      style: Get.isDarkMode
                          ? AppStyles.tsWhiteRegular16
                          : AppStyles.tsBlackRegular16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // Icon(
                  //   Icons.circle,
                  //   size: 6,
                  // ),
                  // SizedBox(
                  //   width: 4,
                  // ),
                  Flexible(
                    child: Text(
                      '- There is no negative marking for the questions that you have not attempted.',
                      style: Get.isDarkMode
                          ? AppStyles.tsWhiteRegular16
                          : AppStyles.tsBlackRegular16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // Icon(
                  //   Icons.circle,
                  //   size: 6,
                  // ),
                  // SizedBox(
                  //   width: 4,
                  // ),
                  Flexible(
                    child: Text(
                      '- You can write this quiz only once. Make sure that you complete the test before you submit the test and/or close the app.',
                      style: Get.isDarkMode
                          ? AppStyles.tsWhiteRegular16
                          : AppStyles.tsBlackRegular16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                '- I have read all the instructions carefully and have understood them. I agree not to cheat or use unfair means in this examinations. I understand that using unfair means of any sort for my or someone else\'s advantage will lead to my immediate disqualification. The decision of Finowledge.com will be final in these matters and cannot be appealed.',
                style: Get.isDarkMode
                    ? AppStyles.tsWhiteRegular16
                    : AppStyles.tsBlackRegular16,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Get.isDarkMode
            ? AppColors.darkCardBackgroundColor
            : AppColors.lightCardBackgroundColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => PracticeTestForQuizView());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.lightGreen,
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Agree and Continue",
                    style: Get.isDarkMode
                        ? AppStyles.tsWhiteMedium14
                        : AppStyles.tsWhiteMedium14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
