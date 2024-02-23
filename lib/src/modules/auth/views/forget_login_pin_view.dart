import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:stoxhero/src/base/screen_utils/flutter_screenutil.dart';
import 'package:stoxhero/src/core/utils/app_lottie.dart';

import '../../../core/core.dart';
import '../../../utils/common_utils.dart';
import '../../modules.dart';

class ForgetLoginPinView extends GetView<AuthController> {
  const ForgetLoginPinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset PIN"),
      ),
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
                        // Align(
                        //   child: Text(
                        //     string("label_enter_verification_code"),
                        //     textAlign: TextAlign.center,
                        //     style: Theme.of(context).textTheme.tsMedium20,
                        //   ),
                        // ),
                        // SizedBox(height: 24),
                        // Align(
                        //   child: Text(
                        //     '${string("label_we_have_sent_six_digit_code")} ${controller.mobileTextController.text}',
                        //     textAlign: TextAlign.center,
                        //     style: Theme.of(context).textTheme.tsGreyRegular16,
                        //   ),
                        // ),
                        SizedBox(height: 24),
                        Form(
                          key: controller.otpFormKey,
                          child: Column(
                            children: [
                              Row(
                                children: [Text("Enter Your OTP")],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Pinput(
                                length: 6,
                                controller: controller.logInPinOtpController,
                                pinAnimationType: PinAnimationType.fade,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                // onCompleted: (value) => controller.verifyOtp(),
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
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [Text("Enter Your PIN ")],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Pinput(
                                length: 6,
                                controller: controller.forgetNewPinController,
                                pinAnimationType: PinAnimationType.fade,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                // onCompleted: (value) => controller.verifyOtp(),
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
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [Text("Confirm Your PIN ")],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Pinput(
                                length: 6,
                                controller:
                                    controller.confirmForgetNewPinController,
                                pinAnimationType: PinAnimationType.fade,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                // onCompleted: (value) => controller.verifyOtp(),
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
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
                child: CommonFilledButton(
                  backgroundColor: Get.isDarkMode
                      ? AppColors.darkGreen
                      : AppColors.lightGreen,
                  label: string("label_verify"),
                  onPressed: () {
                    controller.forgetStudentLoginPinReset(() {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Wrap(
                              children: [
                                Center(
                                  child: Lottie.asset(AppLottie.greenTick,
                                      height: 80.h),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    "Congratulations! Your PIN has been reset successfully"),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.to(() =>
                                      LoginInWithPinView()); // To close the dialog
                                },
                                child: Text("Go Back To Login"),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
