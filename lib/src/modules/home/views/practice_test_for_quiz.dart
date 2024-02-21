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
        title: Text('Practice Your Test'),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.0408),
        child: Column(children: [
          SizedBox(
            height: 321,
            width: 400,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 390,
                  decoration: BoxDecoration(
                      color: Color(0xffA42fC1),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                  bottom: 20,
                  left: 6,
                  child: Container(
                    height: 170,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 5,
                            spreadRadius: 3,
                            color: Color(0xffA42FC1).withOpacity(0.4),
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
                              style: TextStyle(color: Color(0xffA42FC1)),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text("What is UPI?"),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 170,
                  left: 144,
                  child: CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Text(
                        "15",
                        style: TextStyle(
                          color: Color(0xffA42FC1),
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
          OptionsForQuizPracticsWidget(options: "A"),
          OptionsForQuizPracticsWidget(options: "B"),
          OptionsForQuizPracticsWidget(options: "C"),
          OptionsForQuizPracticsWidget(options: "D"),

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
      bottomNavigationBar: BottomAppBar(
        color: Get.isDarkMode
            ? AppColors.darkCardBackgroundColor
            : AppColors.lightCardBackgroundColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompletedQuizPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xffA42fC1),
                padding: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text("Next"),
            ),
          ),
        ),
      ),
    );
  }
}
