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
      child: Column(
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
                Container(
                  height: MediaQuery.of(context).size.width * 0.14,
                  child: Text(
                    myOlympiad?.title ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                /// Grade
                Text(
                  '${myOlympiad?.grade} ${string("label_grade")}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                /// Starts and Seats Left
                Row(
                  children: [
                    Text(
                      '${string("label_starts")}${FormatHelper.formatDateTimeToIST(myOlympiad?.startDateTime)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${string("label_seats_left")} ${(myOlympiad?.maxParticipant ?? 0) - (myOlympiad?.registrationsCount ?? 0)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
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
                        backgroundColor: AppColors.primary,
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
    );
  }
}
