import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class FinowledgeSignupView extends StatefulWidget {
  const FinowledgeSignupView({super.key});

  @override
  State<FinowledgeSignupView> createState() => _FinowledgeSignupViewState();
}

class _FinowledgeSignupViewState extends State<FinowledgeSignupView> {
  late AuthController controller;
  late GlobalKey<FormState> formKey;

  String selectedClass = '6th';

  List<String> classes = ['6th', '7th', '8th', "9th", "10th", "11th", "12th"];

  String selectedCity = 'Jaipur';

  List<String> cities = [
    'Jaipur',
    'Noida',
    'Delhi',
    "Gurugram",
    "Bengaluru",
    "Mumbai",
    "Bhopal"
  ];

  @override
  void initState() {
    super.initState();
    controller = Get.find<AuthController>();
    formKey = GlobalKey<FormState>();
    print('AuthController Code : ${controller.campaignCode.value}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // if (controller.campaignCode.value.isNotEmpty) {
    //   controller.hasCampaignCode(true);
    //   controller.referralTextController.text = controller.campaignCode.value;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Center(child: Container()),
          ),
        ),
      ),
    );
  }
}
