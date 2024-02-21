import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';

class CompletedQuizPage extends StatelessWidget {
  const CompletedQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 520,
            width: 400,
            child: Stack(
              children: [
                Container(
                  height: 340,
                  width: 410,
                  decoration: BoxDecoration(
                      color: Color(0xffA42fC1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor: Colors.white.withOpacity(0.4),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Your score",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffA42fC1),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '100',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffA42fC1),
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: 'pt',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xffA42fC1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 22,
                  child: Container(
                    height: 198,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: Color(0xffA42fC1).withOpacity(0.7),
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffA42fC1)),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '100%',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Color(0xffA42fC1)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text('Completion')
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Center(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffA42fC1)),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '10',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Color(0xffA42fC1)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text('Total Question')
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffA42fC1)),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '07',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: AppColors.lightGreen),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text('Correct Question')
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Center(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffA42fC1)),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '03',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: AppColors.danger),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text('Wrong Question')
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffA42fC1),
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Leaderboard"),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => HomeView());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffA42fC1),
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Home"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
