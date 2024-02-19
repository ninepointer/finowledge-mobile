import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';
import '../../../utils/common_utils.dart';

class OlympiadCard extends GetView<HomeController> {
  final MyActiveOlympiadList? myOlympiad;

  OlympiadCard({
    Key? key,
    this.myOlympiad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 2 -
                    MediaQuery.of(context).size.width * 0.051,
                width: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.102,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: myOlympiad?.image != null
                        ? NetworkImage(myOlympiad!.image!)
                        : AssetImage(
                            Get.isDarkMode
                                ? AppImages.darkAppLogo
                                : AppImages.lightAppLogo,
                          ) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// Content Section
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            myOlympiad?.title ?? '',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// Starts and Seats Left
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${string("label_olympaid_date")} ${FormatHelper.formatDateTimeToIST(myOlympiad?.startDateTime)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.getTimeSlotForQuizRegistrationDetails(
                                myOlympiad?.sId ?? '');
                            Get.to(
                              () => RegistrationView(
                                myOlympiad: myOlympiad,
                              ),
                            );
                          },
                          child: Text(string("label_register")),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.finowledgePurpleAccentColors,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.0408,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.0306),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Seats Left: ${(myOlympiad?.maxParticipant ?? 0) - (myOlympiad?.registrationsCount ?? 0)}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${myOlympiad?.grade} ${string("label_grade")}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
