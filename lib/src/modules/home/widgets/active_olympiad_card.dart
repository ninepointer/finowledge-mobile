import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:stoxhero/src/app/app.dart';

class ActiveOlympiadCard extends GetView<FinowledgeController> {
  final MyActiveOlympiadList? myOlympiad;

  ActiveOlympiadCard({
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.140,
                      child: Text(
                        myOlympiad?.title ?? '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // Text(
                    //   '${myOlympiad?.grade} Grade',
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     color: Colors.grey,
                    //   ),
                    // ),
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
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0204),
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
                              horizontal: 16,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Start'),
                                  content:
                                      Text('Olympiad has not started yet.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text('START'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
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
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${myOlympiad?.grade} Grade',
                style: TextStyle(color: Colors.white),
              ),
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
