import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/app.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
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
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.0103),
                      Image.asset(
                        'assets/images/bigbull.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.0603),
                      CommonCard(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.zero,
                        children: [
                          Align(
                            child: Column(
                              children: [
                                Text(
                                  'On a mission to train',
                                  style: Theme.of(context)
                                      .textTheme
                                      .tsMedium20
                                      .copyWith(color: AppColors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "India\'s next Big Bulls!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .tsMedium20
                                      .copyWith(color: AppColors.black),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Align(
                            child: Text(
                              'Please provide your mobile number, a six digit OTP will be sent for verification.',
                              textAlign: TextAlign.center,
                              style: AppStyles.tsGreyRegular16,
                            ),
                          ),
                          SizedBox(height: 24),
                          Form(
                            key: formKey,
                            child: CommonTextField(
                              controller: controller.mobileTextController,
                              hintText: 'Enter your mobile number',
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
                                  return 'This field is required!';
                                } else if (value.length == 10) if (!regExp
                                    .hasMatch(value)) {
                                  return 'Please enter valid mobile number!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Obx(
                            () => CommonFilledButton(
                              backgroundColor: Get.isDarkMode
                                  ? AppColors.darkGreen
                                  : AppColors.lightGreen,
                              isLoading: controller.isLoadingStatus,
                              label: 'Continue',
                              onPressed: () {
                                controller.getActiveCities();
                                bool isValid =
                                    formKey.currentState?.validate() ?? false;
                                if (isValid) controller.userSignin();
                                // Get.toNamed(AppRoutes.signup);
                              },
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
