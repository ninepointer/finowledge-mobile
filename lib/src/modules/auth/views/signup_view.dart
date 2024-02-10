import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stoxhero/src/app/app.dart';

import '../../../core/core.dart';
import '../../modules.dart';
import 'package:dropdown_search/dropdown_search.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late AuthController controller;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AuthController>();
    controller.getActiveCities();
    if (controller.activeCities.isNotEmpty) {
      controller.selectedCity = controller.activeCities.first.sId ?? '';
    }
    formKey = GlobalKey<FormState>();
    // print('AuthController Code : ${controller.campaignCode.value}');
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
            child: Center(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(height: 24),
                          // Image.asset(
                          //   'assets/images/signup.png',
                          //   width: 120,
                          //   height: 120,
                          // ),
                          //   SizedBox(height: 24),
                          CommonCard(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.zero,
                            children: [
                              Align(
                                child: Text(
                                  // 'Join us now to learn and earn\nfrom the Stock Market!',
                                  "Welcome to Finowledge!",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.tsMedium20,
                                ),
                              ),
                              SizedBox(height: 12),
                              Align(
                                child: Text(
                                  // 'Please provide your details, confirmation will be send on the given email.',
                                  "Fill in these details to get you started!",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .tsGreyRegular16,
                                ),
                              ),
                              SizedBox(height: 12),
                              CommonTextField(
                                controller: controller.fullNameTextController,
                                hintText: 'Enter your full name',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: AppColors.grey,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length == 0) {
                                    return 'This field is required!';
                                  }
                                  return null;
                                },
                              ),
                              CommonTextField(
                                controller: controller.parentNameTextController,
                                hintText: 'Enter your parents\'s name',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: AppColors.grey,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length == 0) {
                                    return 'This field is required!';
                                  }
                                  return null;
                                },
                              ),
                              GestureDetector(
                                onTap: () =>
                                    controller.showDateRangePicker(context),
                                child: CommonTextField(
                                  isDisabled: true,
                                  controller: controller.dobTextController,
                                  hintText: 'Enter your date of birth',
                                  prefixIcon: Icon(
                                    Icons.calendar_month,
                                    color: AppColors.grey,
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length == 0) {
                                      return 'This field is required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 16),
                                child: DropdownButtonFormField<String>(
                                  menuMaxHeight: 200,
                                  value: controller.selectedClass,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      controller.selectedClass = newValue ?? '';
                                    });
                                  },
                                  decoration: InputDecoration(
                                    // labelText: 'Select Class',
                                    isDense: true,
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: AppColors.lightGreen,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: AppColors.primary.shade700,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: AppColors.danger.shade700,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.grey.withOpacity(.1),
                                  ),
                                  items: controller.classes
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .tsRegular16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),

                              CommonTextField(
                                controller: controller.schoolNameTextController,
                                hintText: 'Enter your school name',
                                prefixIcon: Icon(
                                  Icons.school,
                                  color: AppColors.grey,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 16),
                                child: DropdownButtonFormField<String>(
                                  // iconSize:
                                  //     12, // Set the size of the dropdown icon
                                  // itemHeight: 50,
                                  menuMaxHeight: 200,
                                  value: controller.selectedCity.isNotEmpty
                                      ? controller.selectedCity
                                      : null,

                                  onChanged: (String? newValue) {
                                    setState(() {
                                      // Find the city object corresponding to the selected ID
                                      final selectedCityObject =
                                          controller.activeCities.firstWhere(
                                        (city) => city.sId == newValue,
                                        orElse: () => ActiveCitiesList(
                                            sId: '',
                                            name:
                                                ''), // Provide a default value if not found
                                      );
                                      controller.selectedCity =
                                          selectedCityObject.sId ??
                                              ''; // Set the selected city's ID
                                    });
                                  },
                                  decoration: InputDecoration(
                                    // labelText: 'Select Class',
                                    isDense: true,

                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: AppColors.lightGreen,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: AppColors.primary.shade700,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: AppColors.danger.shade700,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.grey.withOpacity(.1),
                                  ),
                                  items: controller.activeCities
                                      .map<DropdownMenuItem<String>>(
                                          (ActiveCitiesList city) {
                                    return DropdownMenuItem<String>(
                                      value: city.sId,
                                      child: Text(
                                        city.name ?? '',
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .tsRegular16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),

                              // CommonDropdown(hint: hint, value: value, dropdownItems: dropdownItems, onChanged: onChanged)
                              CommonFilledButton(
                                backgroundColor: Get.isDarkMode
                                    ? AppColors.darkGreen
                                    : AppColors.lightGreen,
                                label: 'PROCEED',
                                onPressed: () {
                                  bool isValid =
                                      formKey.currentState?.validate() ?? false;
                                  if (isValid) controller.createUserAccount();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
