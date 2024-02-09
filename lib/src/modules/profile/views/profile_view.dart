import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stoxhero/src/modules/modules.dart';
import 'package:stoxhero/src/modules/profile/widgets/profile_list_tile.dart';

import '../../../core/core.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            // color: AppColors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.grey.withOpacity(.3),
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 70, // Adjust the radius as needed
                            backgroundColor: AppColors.white.withOpacity(1),
                            child: ClipOval(
                              child: controller.userDetails.value.profilePhoto
                                          ?.url ==
                                      null
                                  ? Image.asset(
                                      Get.isDarkMode
                                          ? AppImages.darkAppLogo
                                          : AppImages.lightAppLogo,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      controller.userDetails.value.profilePhoto
                                              ?.url ??
                                          '',
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${controller.userDetails.value.studentName}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Class: ${controller.userDetails.value.schoolDetails?.grade}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "${controller.userDetails.value.schoolDetails?.school}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                controller.loadProfileDetails();
                await Get.toNamed(AppRoutes.profileDetails);
                controller.loadData();
              },
              child: Text('View Profile'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
