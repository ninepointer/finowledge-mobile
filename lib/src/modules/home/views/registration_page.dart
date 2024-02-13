import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';

class RegistrationView extends StatefulWidget {
  final MyActiveOlympiadList? myOlympiad;
  // final TimeSlotForQuizList? timeslot;
  RegistrationView({
    Key? key,
    this.myOlympiad,
    // this.timeslot,
  }) : super(key: key);
  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  late HomeController controller;
  int selectedIndex = -1;
  @override
  void initState() {
    super.initState();
    controller = Get.find<HomeController>();
    controller.loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.0306,
              vertical: MediaQuery.of(context).size.width * 0.0520),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Please select your test slot",
                      style: AppStyles.tsBlackMedium20,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.0306,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Test Date: ${FormatHelper.formatDate(widget.myOlympiad?.startDateTime)}",
                      style: AppStyles.tsBlackRegular16,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.0510,
                ),
                Container(
                  height: 500,
                  child: ListView.builder(
                    itemCount: controller.timeSlotForQuizRegistrationList
                        .length, // Replace myOlympiadList with your list of Olympiads
                    itemBuilder: (BuildContext context, int index) {
                      var timeslot =
                          controller.timeSlotForQuizRegistrationList[index];
                      bool isSelected = index == selectedIndex;
                      bool isDisabled = timeslot.spotLeft == 0;
                      return GestureDetector(
                        onTap: () {
                          if (!isDisabled) {
                            setState(() {
                              selectedIndex = isSelected ? -1 : index;
                            });
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            // color: AppColors.white,
                            color: isSelected ? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(16),

                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${FormatHelper.formatTimeOnlyToIST(timeslot.slotTime)} - ${timeslot.spotLeft} Spots Lefts",
                                style: isDisabled
                                    ? AppStyles
                                        .tsGreyRegular16 // Style for disabled container
                                    : isSelected
                                        ? AppStyles.tsWhiteRegular16
                                        : AppStyles.tsBlackRegular16,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.lightCardBackgroundColor,
        child: Container(
          margin: EdgeInsets.all(16.0),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (selectedIndex == -1 ||
                  controller.timeSlotForQuizRegistrationList[selectedIndex]
                          .spotLeft ==
                      0) {
                SnackbarHelper.showSnackbar(
                    "Please select a valid time slot for registration");
              } else {
                controller.timeSlotForQuizRegistrationList[selectedIndex];
                Get.to(() => UploadProfileImageView());
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Set border radius
              ),
            ),
            child: Text('Next'),
          ),
        ),
      ),
    );
  }
}
