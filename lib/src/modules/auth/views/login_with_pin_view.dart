import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:stoxhero/src/base/screen_utils/flutter_screenutil.dart';
import 'package:stoxhero/src/core/utils/app_lottie.dart';
import 'package:pinput/pinput.dart';

import '../../../app/app.dart';
import '../../../utils/common_utils.dart';

class LoginInWithPinView extends StatefulWidget {
  const LoginInWithPinView({super.key});

  @override
  State<LoginInWithPinView> createState() => _LoginInWithPinViewState();
}

class _LoginInWithPinViewState extends State<LoginInWithPinView> {
  late AuthController controller;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AuthController>();
    formKey = GlobalKey<FormState>();
    controller.pinTextController.clear();

    _initializeDynamicLink();
  }

  Future _initializeDynamicLink() async {
    await DynamicLinkServices.initializeDynamicLink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(height: 0.1.h),
                        Lottie.asset(AppLottie.enterPin, height: 0.40.sh),
                        SizedBox(height: 0.1.h),
                        Align(
                          child: Column(
                            children: [
                              Text(
                                "Enter Your Mobile Number And PIN",
                                style: Theme.of(context)
                                    .textTheme
                                    .tsMedium24
                                    .copyWith(
                                        color: Get.isDarkMode
                                            ? AppColors.white
                                            : AppColors.black),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        // Align(
                        //   child: Text(
                        //     string("label_otp_des"),
                        //     textAlign: TextAlign.center,
                        //     style: AppStyles.tsGreyRegular16,
                        //   ),
                        // ),
                        SizedBox(height: 30.h),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Enter your mobile number"),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CommonTextField(
                                controller: controller.mobileTextController,
                                hintText: "",
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: AppColors.grey,
                                ),
                                validator: (value) {
                                  RegExp regExp = RegExp(r'^[6-9]\d{9}$');
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length == 0) {
                                    return string(
                                        "label_mobile_number_is_required");
                                  } else if (value.length == 10) if (!regExp
                                      .hasMatch(value)) {
                                    return string(
                                        "label_enter_valid_mobile_number");
                                  }
                                  return null;
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Enter your 6 digits PIN"),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Pinput(
                                length: 6,
                                controller: controller.pinTextController,
                                pinAnimationType: PinAnimationType.fade,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                // onCompleted: (value) => controller.(),
                                defaultPinTheme: PinTheme(
                                  width: 64,
                                  height: 64,
                                  textStyle:
                                      Theme.of(context).textTheme.tsSemiBold20,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                focusedPinTheme: PinTheme(
                                  width: 64,
                                  height: 64,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .tsWhiteSemiBold22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.lightGreen,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                errorPinTheme: PinTheme(
                                  width: 64,
                                  height: 64,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .tsPrimarySemiBold20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.danger.shade900,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ErrorMessages.required;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (controller.mobileTextController.text !=
                                        '' &&
                                    controller
                                            .mobileTextController.text.length ==
                                        10) {
                                  controller.studentLoginPinReset();
                                } else {
                                  SnackbarHelper.showSnackbar(
                                      "please enter your mobile number to reset your pin");
                                }
                              },
                              child: Text(
                                "Forget PIN?",
                                style: AppStyles.tsBlackMedium14
                                    .copyWith(color: AppColors.lightGreen),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => Container(
                  margin: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
                  child: CommonFilledButton(
                    backgroundColor: Get.isDarkMode
                        ? AppColors.darkGreen
                        : AppColors.lightGreen,
                    isLoading: controller.isLoadingStatus,
                    label: string("label_get_otp"),
                    onPressed: () {
                      bool isValid = formKey.currentState?.validate() ?? false;
                      if (isValid) controller.studentSigninWithPin();
                      // Get.toNamed(AppRoutes.signup);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
