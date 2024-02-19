import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';

class PracticeTestForQuizView extends StatefulWidget {
  @override
  _PracticeTestForQuizViewState createState() =>
      _PracticeTestForQuizViewState();
}

class _PracticeTestForQuizViewState extends State<PracticeTestForQuizView> {
  // Dummy list of quiz questions
  List<String> questions = [
    "What is the capital of France?",
    "What is the largest mammal?",
    "What is 2 + 2?",
  ];

  // Dummy list of answer choices
  List<List<String>> choices = [
    ["Paris", "London", "Berlin", "Rome"],
    ["Elephant", "Blue Whale", "Giraffe", "Horse"],
    ["3", "4", "5", "6"],
  ];

  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice Your Test'),
      ),
      //  body:
      // Padding(
      //   padding: EdgeInsets.all(20.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Text(
      //         questions[currentQuestionIndex],
      //         style: TextStyle(fontSize: 24.0),
      //       ),
      //       SizedBox(height: 20.0),
      //       // Build answer choices
      //       ...choices[currentQuestionIndex].map((choice) {
      //         return ElevatedButton(
      //           onPressed: () {
      //             // Handle answer selection here
      //             // For simplicity, just move to the next question
      //             setState(() {
      //               currentQuestionIndex++;
      //             });
      //           },
      //           child: Text(choice),
      //         );
      //       }).toList(),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(8),
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
                  left: 15,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "05",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "07",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              "Question 3/10",
                              style: TextStyle(color: Color(0xffA42FC1)),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text("What is computer"),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 170,
                  left: 150,
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
          OptionsForQuizPracticsWidget(options: "Option A"),
          OptionsForQuizPracticsWidget(options: "Option B"),
          OptionsForQuizPracticsWidget(options: "Option C"),
          OptionsForQuizPracticsWidget(options: "Option D"),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffA42FC1),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}
