import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';

class PracticeTestForQuizView extends StatefulWidget {
  @override
  _PracticeTestForQuizViewState createState() =>
      _PracticeTestForQuizViewState();
}

class _PracticeTestForQuizViewState extends State<PracticeTestForQuizView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompletedQuizPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.lightGreen,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: Get.isDarkMode
                        ? AppStyles.tsWhiteRegular16
                        : AppStyles.tsWhiteRegular16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.0408),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 321,
              width: 400,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: 390,
                    decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 6,
                    child: Container(
                      height: 230,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 5,
                              spreadRadius: 3,
                              color: AppColors.lightGreen.withOpacity(0.4),
                            )
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "05",
                            //       style: TextStyle(
                            //         color: Colors.green,
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //     Text(
                            //       "07",
                            //       style: TextStyle(
                            //         color: Colors.red,
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Center(
                              child: Text(
                                "Question 1/10",
                                style: TextStyle(color: AppColors.lightGreen),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "What does the term “interest” refer to in banking?",
                              style: Get.isDarkMode
                                  ? AppStyles.tsBlackRegular14
                                  : AppStyles.tsBlackRegular14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 230,
                    left: 144,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Text(
                          "120",
                          style: TextStyle(
                            color: AppColors.lightGreen,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OptionsForQuizPracticsWidget(
              options: "A",
              optionsTask:
                  "The amount of money a bank charges for its services",
            ),
            OptionsForQuizPracticsWidget(
              options: "B",
              optionsTask:
                  "The rate at which a bank lends money to its customers",
            ),
            OptionsForQuizPracticsWidget(
              options: "C",
              optionsTask:
                  "The rate at which a bank pays customers for holding their money in an account",
            ),
            OptionsForQuizPracticsWidget(
              options: "D",
              optionsTask: "The total balance in a bank account",
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 18),
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         primary: Color(0xffA42FC1),
            //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         elevation: 5,
            //       ),
            //       onPressed: () {
            //         Navigator.pushReplacement(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => CompletedQuizPage()));
            //       },
            //       child: Container(
            //         alignment: Alignment.center,
            //         child: Text(
            //           "Next",
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 18,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       )),
            // ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Get.isDarkMode
            ? AppColors.darkCardBackgroundColor
            : AppColors.lightCardBackgroundColor,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompletedQuizPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.lightGreen,
                      padding: EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Back",
                      style: Get.isDarkMode
                          ? AppStyles.tsWhiteRegular16
                          : AppStyles.tsWhiteRegular16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompletedQuizPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.lightGreen,
                      padding: EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: Get.isDarkMode
                          ? AppStyles.tsWhiteRegular16
                          : AppStyles.tsWhiteRegular16,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
