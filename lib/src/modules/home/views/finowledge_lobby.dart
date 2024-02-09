import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../app/app.dart';

class FinowledgeLobbyView extends StatefulWidget {
  const FinowledgeLobbyView({super.key});

  @override
  State<FinowledgeLobbyView> createState() => _FinowledgeLobbyViewState();
}

class _FinowledgeLobbyViewState extends State<FinowledgeLobbyView> {
  late FinowledgeController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.find<FinowledgeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   padding: EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //       color: Color(0xFF3F3F3F),
          //       borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(16),
          //         bottomRight: Radius.circular(16),
          //       )),
          //   child: Column(
          //     children: [
          //       // Row(
          //       //   mainAxisAlignment: MainAxisAlignment.center,
          //       //   children: [
          //       //     Text(
          //       //       "My Profile",
          //       //       style: AppStyles.tsBlackRegular18,
          //       //     ),
          //       //   ],
          //       // ),
          //       // SizedBox(
          //       //   height: MediaQuery.of(context).size.width * 0.0102,
          //       // ),
          //       Container(
          //         height: 100,
          //         width: 100,
          //         decoration: BoxDecoration(
          //           // color: AppColors.white,
          //           shape: BoxShape.circle,
          //           border: Border.all(
          //             color: AppColors.white.withOpacity(1),
          //           ),
          //         ),
          //         child: ClipOval(
          //             child:
          //                 //  controller.userDetails.value.profilePhoto == null
          //                 //     ?
          //                 Padding(
          //                     padding: EdgeInsets.all(2),
          //                     child: Image.asset(
          //                       Get.isDarkMode
          //                           ? AppImages.darkAppLogo
          //                           : AppImages.lightAppLogo,
          //                       fit: BoxFit.cover,
          //                     ))
          //             // : Image.network(
          //             //     controller.userDetails.value.profilePhoto?.url ?? '',
          //             //     fit: BoxFit.cover,
          //             //   ),
          //             ),
          //       ),
          //       SizedBox(
          //         height: MediaQuery.of(context).size.width * 0.0102,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "Rahul Kumar Gupta",
          //             style: AppStyles.tsBlackRegular20
          //                 .copyWith(color: AppColors.white),
          //           )
          //         ],
          //       ),
          //       SizedBox(
          //         height: MediaQuery.of(context).size.width * 0.0102,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "Class: 6th",
          //             style: AppStyles.tsBlackRegular16
          //                 .copyWith(color: AppColors.white),
          //           )
          //         ],
          //       ),
          //       SizedBox(
          //         height: MediaQuery.of(context).size.width * 0.0102,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Flexible(
          //             child: Text(
          //               "Sent xevious convent school gandhinagar, Jaipur",
          //               style: AppStyles.tsBlackRegular16
          //                   .copyWith(color: AppColors.white),
          //               textAlign: TextAlign.center,
          //             ),
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      body: Container(
        child: Text("hwllo"),
      ),
    );
  }
}
