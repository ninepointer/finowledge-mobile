import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoxhero/src/app/app.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class OlympiadCard extends GetView<FinowledgeController> {
  final MyActiveOlympiadList? myOlympiad;

  OlympiadCard({
    Key? key,
    this.myOlympiad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
            offset: Offset(-5, -5),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          // Content Section
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
                SizedBox(height: 8),
                // Grade
                Text(
                  '${myOlympiad?.grade} Grade',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                // Starts and Seats Left
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Starts: ${FormatHelper.formatDateTimeToIST(myOlympiad?.startDateTime)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Seats left: ${(myOlympiad?.maxParticipant ?? 0) - (myOlympiad?.registrationsCount ?? 0)}',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: ReferFriendContent(
                                contest: myOlympiad,
                              ),
                            );
                          },
                        );
                      },
                      child: Text('INVITE FRIENDS'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
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
                    ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => RegistrationView(),
                        );
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       title: Text('Registration'),
                        //       content:
                        //           Text('Registration has not started yet.'),
                        //       actions: <Widget>[
                        //         TextButton(
                        //           onPressed: () {
                        //             Navigator.of(context).pop();
                        //           },
                        //           child: Text('OK'),
                        //         ),
                        //       ],
                        //     );
                        // },
                        //  );
                      },
                      child: Text('REGISTER'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
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
                    GestureDetector(
                      onTap: () {
                        _openWhatsAppGroup();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 20,
                        child: Icon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.white,
                          size: 20,
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

_openWhatsAppGroup() async {
  const String groupLink = 'https://chat.whatsapp.com/Bcjt7NbDTyz1odeF8RDtih';

  final String whatsappUrl = "whatsapp://open?text=$groupLink";

  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    await launch(groupLink);
  }
}
