import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/common_utils.dart';

class UploadProfileImageView extends StatefulWidget {
  TimeSlotForQuizList? slotForQuizList;
  final MyActiveOlympiadList? myOlympiad;

  UploadProfileImageView({Key? key, this.slotForQuizList, this.myOlympiad})
      : super(key: key);

  @override
  State<UploadProfileImageView> createState() => _UploadProfileImageViewState();
}

class _UploadProfileImageViewState extends State<UploadProfileImageView> {
  late HomeController controller;
  late AuthController authController;
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedImage?.path ?? "");
    });
  }

  @override
  void initState() {
    super.initState();
    controller = Get.find<HomeController>();
    authController = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(string("label_upload_profile_image")),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.0306,
            vertical: MediaQuery.of(context).size.width * 0.0520),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.0520,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  string("label_please_upload_your_profile_image"),
                  style: AppStyles.tsBlackMedium18,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.0520,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: _imageFile == null
                      ? CircleAvatar(
                          // Placeholder profile image when no image is selected
                          backgroundImage: AssetImage(AppImages.lightAppLogo),
                          radius: 60,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(_imageFile!.path)),
                          radius: 60,
                        ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: pickImage,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(string("label_upload_profile_image")),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    string("label_why_upload_desc"),
                    style: AppStyles.tsBlackRegular14,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.lightCardBackgroundColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    // if (widget.myOlympiad?.entryFee == 0) {
                    await controller.getFinalRegistrationPageDetails(
                        widget.slotForQuizList?.slotId ?? '',
                        widget.myOlympiad?.sId ?? '');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                              "${controller.registrationFinalPageData.value.message}"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                controller.getUserAllOlympiadDetails();
                                Get.to(() => HomeView()); // To close the dialog
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                    //   }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(string("label_skip")),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _imageFile == null
                      ? null
                      : () async {
                          if (_imageFile != null) {
                            await controller
                                .saveUserProfilePhotoDetails(_imageFile);
                            await controller.getFinalRegistrationPageDetails(
                                widget.slotForQuizList?.slotId ?? '',
                                widget.myOlympiad?.sId ?? '');
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                      "${controller.registrationFinalPageData.value.message}"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        controller.getUserAllOlympiadDetails();
                                        authController
                                            .getUserDetails(); // To close the dialog
                                      },
                                      child: Text("Close"),
                                    ),
                                  ],
                                );
                              },
                            );
                            // authController.getUserDetails();
                            //  Get.to(() => HomeView());
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(string("label_save")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
