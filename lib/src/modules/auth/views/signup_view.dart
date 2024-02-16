import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stoxhero/src/app/app.dart';
import 'package:stoxhero/src/base/screen_utils/flutter_screenutil.dart';

import '../../../core/utils/app_lottie.dart';
import '../../../utils/common_utils.dart';
import 'package:dropdown_search/dropdown_search.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late AuthController controller;
  late GlobalKey<FormState> formKey;
  String schoolName = "";
  String cityName = "";

  @override
  void initState() {
    super.initState();
    controller = Get.find<AuthController>();

    if (controller.activeCities.isNotEmpty) {
      controller.selectedCity = controller.activeCities.first.sId ?? '';
    }
    formKey = GlobalKey<FormState>();
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
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(AppLottie.signUp, height: 0.45.sh),
                            Align(
                              child: Text(
                                string("label_welcome_to_finowledge"),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.tsMedium20,
                              ),
                            ),
                            SizedBox(height: 12),
                            Align(
                              child: Text(
                                string("label_fill_details"),
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.tsGreyRegular16,
                              ),
                            ),
                            SizedBox(height: 12),
                            CommonTextField(
                              controller: controller.fullNameTextController,
                              hintText: string("label_enter_full_name"),
                              prefixIcon: Icon(
                                Icons.person,
                                color: AppColors.grey,
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length == 0) {
                                  return string("label_full_name_is_required");
                                }
                                return null;
                              },
                            ),
                            CommonTextField(
                              controller: controller.parentNameTextController,
                              hintText: string("label_enter_parents_name"),
                              prefixIcon: Icon(
                                Icons.person,
                                color: AppColors.grey,
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length == 0) {
                                  return string(
                                      "label_parents_name_is_required");
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
                                hintText: string("label_enter_birth_date"),
                                prefixIcon: Icon(
                                  Icons.calendar_month,
                                  color: AppColors.grey,
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length == 0) {
                                    return string(
                                        "label_birth_date_is_required");
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

                            //state dropdown

                            Container(
                              padding: EdgeInsets.only(bottom: 16),
                              child: DropdownSearch<String>(
                                popupProps: PopupProps.menu(
                                  showSelectedItems: true,
                                  // disabledItemFn: (String s) =>
                                  //     s.startsWith('I'),
                                  showSearchBox: true,
                                ),
                                items: controller.states
                                    .map<String>((states) => states)
                                    .toList(),
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    labelText: string("label_choose_state"),
                                    hintText: string("label_search_state_here"),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
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
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    controller.selectedState = newValue ?? '';

                                    controller.getActiveCities(
                                        controller.selectedState);
                                  });
                                },
                                selectedItem: controller.selectedState,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(bottom: 16),
                              child: DropdownSearch<String>(
                                popupProps: PopupProps.menu(
                                  showSelectedItems: true,
                                  // disabledItemFn: (String s) =>
                                  //     s.startsWith('I'),
                                  showSearchBox: true,
                                ),
                                items: controller.activeCities
                                    .map<String>((ActiveCitiesList city) =>
                                        city.name ?? '')
                                    .toList(),
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    labelText: string("label_choose_city"),
                                    hintText: string("label_search_cit_here"),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
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
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    // Find the city object corresponding to the selected ID
                                    final selectedCityObject =
                                        controller.activeCities.firstWhere(
                                      (city) => city.name == newValue,
                                      orElse: () => ActiveCitiesList(
                                        sId: '',
                                        name:
                                            '', // Provide a default value if not found
                                      ),
                                    );
                                    cityName = selectedCityObject.name ?? '';
                                    controller.selectedCity =
                                        selectedCityObject.sId ?? '';
                                    controller.selectedCityForState =
                                        selectedCityObject.name ?? '';
                                    controller.fetchschool
                                        .clear(); // Clear existing school list
                                    controller.fetchSchoolListDetails();
                                  });
                                },
                                selectedItem: cityName,
                              ),
                            ),

                            ///school

                            Obx(
                              () => Container(
                                padding: EdgeInsets.only(bottom: 16),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSelectedItems: true,
                                    // disabledItemFn: (String s) =>
                                    //     s.startsWith('I'),
                                    showSearchBox: true,
                                  ),
                                  items: controller.fetchschool
                                      .map<String>(
                                          (FetchSchoolResponse school) =>
                                              school.schoolString ?? '')
                                      .toList(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: string("label_choose_school"),
                                      hintText: string("hint_choose_school"),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
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
                                  ),
                                  onChanged: (String? newValue) {
                                    controller.fetchSchoolListDetails();
                                    setState(() {
                                      final schoolList = controller.fetchschool;
                                      final selectedSchool =
                                          schoolList.firstWhere(
                                        (school) =>
                                            school.schoolString == newValue,
                                        orElse: () => FetchSchoolResponse(
                                          sId: '',
                                          schoolString: '',
                                        ),
                                      );

                                      controller.selectedSchoolName.value =
                                          selectedSchool.sId ?? '';
                                      schoolName =
                                          selectedSchool.schoolString ?? '';
                                    });
                                  },
                                  selectedItem: schoolName,
                                ),
                              ),
                            ),

                            // Container(
                            //   padding: EdgeInsets.only(bottom: 16),
                            //   child: DropdownButtonFormField<String>(
                            //     // iconSize:
                            //     //     12, // Set the size of the dropdown icon
                            //     // itemHeight: 50,
                            //     menuMaxHeight: 200,
                            //     value: controller.selectedCity.isNotEmpty
                            //         ? controller.selectedCity
                            //         : null,

                            //     onChanged: (String? newValue) {
                            //       setState(() {
                            //         // Find the city object corresponding to the selected ID
                            //         final selectedCityObject =
                            //             controller.activeCities.firstWhere(
                            //           (city) => city.sId == newValue,
                            //           orElse: () => ActiveCitiesList(
                            //               sId: '',
                            //               name:
                            //                   ''), // Provide a default value if not found
                            //         );
                            //         controller.selectedCity =
                            //             selectedCityObject.sId ??
                            //                 ''; // Set the selected city's ID
                            //       });
                            //     },
                            //     decoration: InputDecoration(
                            //       // labelText: 'Select Class',
                            //       isDense: true,

                            //       border: OutlineInputBorder(),
                            //       enabledBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(8),
                            //         borderSide: BorderSide.none,
                            //       ),
                            //       focusedBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(8),
                            //         borderSide: BorderSide(
                            //           width: 2,
                            //           color: AppColors.lightGreen,
                            //         ),
                            //       ),
                            //       focusedErrorBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(8),
                            //         borderSide: BorderSide(
                            //           width: 2,
                            //           color: AppColors.primary.shade700,
                            //         ),
                            //       ),
                            //       errorBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(8),
                            //         borderSide: BorderSide(
                            //           width: 2,
                            //           color: AppColors.danger.shade700,
                            //         ),
                            //       ),
                            //       filled: true,
                            //       fillColor: AppColors.grey.withOpacity(.1),
                            //     ),
                            //     items: controller.activeCities
                            //         .map<DropdownMenuItem<String>>(
                            //             (ActiveCitiesList city) {
                            //       return DropdownMenuItem<String>(
                            //         value: city.sId,
                            //         child: Text(
                            //           city.name ?? '',
                            //           maxLines: 1,
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .tsRegular16,
                            //           overflow: TextOverflow.ellipsis,
                            //         ),
                            //       );
                            //     }).toList(),
                            //   ),
                            // ),

                            // CommonDropdown(hint: hint, value: value, dropdownItems: dropdownItems, onChanged: onChanged)
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
                      label: string("label_proceed"),
                      onPressed: () {
                        bool isValid =
                            formKey.currentState?.validate() ?? false;
                        if (isValid) controller.createUserAccount();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
