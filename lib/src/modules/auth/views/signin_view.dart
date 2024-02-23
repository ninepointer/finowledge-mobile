import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:stoxhero/src/base/screen_utils/flutter_screenutil.dart';
import 'package:stoxhero/src/core/utils/app_lottie.dart';

import '../../../app/app.dart';
import '../../../utils/common_utils.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late AuthController controller;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AuthController>();
    formKey = GlobalKey<FormState>();
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
                        SizedBox(height: 0.2.h),
                        Lottie.asset(AppLottie.otpVerification,
                            height: 0.45.sh),
                        SizedBox(height: 0.2.h),
                        Align(
                          child: Column(
                            children: [
                              Text(
                                string("label_otp_verification"),
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
                        SizedBox(height: 40.h),
                        Align(
                          child: Text(
                            string("label_otp_des"),
                            textAlign: TextAlign.center,
                            style: AppStyles.tsGreyRegular16,
                          ),
                        ),
                        SizedBox(height: 60.h),
                        Form(
                          key: formKey,
                          child: CommonTextField(
                            controller: controller.mobileTextController,
                            hintText: string("label_enter_mobile_number"),
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
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(
                              //   "Login with pin?",
                              //   style: Theme.of(context).textTheme.tsRegular16,
                              //   textAlign: TextAlign.center,
                              // ),
                              // SizedBox(
                              //   width: 10.w,
                              // ),
                              InkWell(
                                onTap: () => Get.to(() => LoginInWithPinView()),
                                child: Text(
                                  "Login with PIN?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.lightGreen,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.lightGreen,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                      if (isValid) controller.userSignin();
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
