import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stoxhero/src/utils/common_utils.dart';
import '../../../app/app.dart';

class ProfileDetailsView extends StatefulWidget {
  @override
  _ProfileDetailsViewState createState() => _ProfileDetailsViewState();
}

class _ProfileDetailsViewState extends State<ProfileDetailsView> {
  late ProfileController controller;
  late AuthController authController;

  @override
  void initState() {
    super.initState();
    controller = Get.find<ProfileController>();
    authController = Get.find<AuthController>();
    controller.studentNameTextController.text =
        controller.userDetails.value.studentName ?? '';
    controller.parentsNameTextController.text =
        controller.userDetails.value.schoolDetails?.parentsName ?? '';
    authController.dobTextController.text = DateFormat("dd-MM-yyyy").format(
        DateTime.parse(controller.userDetails.value.schoolDetails?.dob ?? ''));
    controller.stateTextController.text =
        controller.userDetails.value.schoolDetails?.state ?? '';
    controller.selectedCityForState.value =
        controller.userDetails.value.schoolDetails?.city?.name ?? '';
    controller.selectedSchoolName.value =
        controller.userDetails.value.schoolDetails?.school?.schoolName ?? '';
    controller.selectedClass.value =
        controller.userDetails.value.schoolDetails?.grade?.grade ?? '';
    controller.section.value =
        controller.userDetails.value.schoolDetails?.section ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(string("label_my_profile")),
          actions: [
            IconButton(
              splashRadius: 24,
              icon: controller.isEditEnabled.value == true
                  ? Icon(Icons.save)
                  : Icon(Icons.edit),
              onPressed: () {
                if (controller.isEditEnabled.value == true) {
                  controller.saveUserProfileDetails();
                  FocusScope.of(context).unfocus();
                } else {
                  controller.isEditEnabled.toggle();
                }
              },
            ),
          ],
        ),
        body: Visibility(
          visible: controller.isProfileLoadingStatus,
          child: ListViewShimmer(
            itemCount: 10,
            shimmerCard: SmallCardShimmer(),
          ),
          replacement: LoaderOverlay(
            child: Container(
              margin: EdgeInsets.only(top: 4),
              color: Theme.of(context).cardColor,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width * 0.0306,
                ).copyWith(bottom: 100),
                child: AbsorbPointer(
                  absorbing: !controller.isEditEnabled.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        string("label_personal_information"),
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.tsMedium16,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0306,
                      ),
                      CommonTextField(
                        controller: controller.studentNameTextController,
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
                        controller: controller.parentsNameTextController,
                        hintText: string("label_enter_parents_name"),
                        // focusNode: FocusNode(),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.grey,
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length == 0) {
                            return string("label_parents_name_is_required");
                          }
                          return null;
                        },
                      ),
                      GestureDetector(
                        onTap: () =>
                            authController.showDateRangePicker(context),
                        child: CommonTextField(
                          isDisabled: true,
                          controller: authController.dobTextController,
                          hintText: string("label_enter_birth_date"),
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: AppColors.grey,
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length == 0) {
                              return string("label_birth_date_is_required");
                            }
                            return null;
                          },
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
                          items: authController.states
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
                          onChanged: (String? newValue) async {
                            controller.stateTextController.text =
                                newValue ?? '';
                            context.loaderOverlay.show();
                            await authController.getActiveCities(
                                controller.stateTextController.text);
                            context.loaderOverlay.hide();
                          },
                          selectedItem: controller.stateTextController.text,
                        ),
                      ),

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
                            items: authController.activeCities
                                .map<String>(
                                    (ActiveCitiesList city) => city.name ?? '')
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
                            onChanged: (String? newValue) async {
                              final selectedCityObject =
                                  authController.activeCities.firstWhere(
                                (city) => city.name == newValue,
                                orElse: () => ActiveCitiesList(
                                  sId: '',
                                  name:
                                      '', // Provide a default value if not found
                                ),
                              );
                              authController
                                  .selectedCity(selectedCityObject.sId ?? '');
                              controller.selectedCityForState(
                                  selectedCityObject.name ?? '');
                              authController.fetchSchool
                                  .clear(); // Clear existing school list
                              context.loaderOverlay.show();
                              await authController.fetchSchoolListDetails();
                              context.loaderOverlay.hide();
                            },
                            selectedItem: controller.selectedCityForState.value,
                          ),
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
                            items: authController.fetchSchool
                                .map<String>((fetchSchoolList school) =>
                                    school.schoolString ?? '')
                                .toList(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
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
                            onChanged: (String? newValue) async {
                              context.loaderOverlay.show();
                              // await controller.fetchSchoolListDetails();
                              final schoolList = authController.fetchSchool;
                              final selectedSchool = schoolList.firstWhere(
                                (school) => school.schoolString == newValue,
                                orElse: () => fetchSchoolList(
                                  sId: '',
                                  schoolString: '',
                                ),
                              );
                              controller.schoolNameTextController.text =
                                  selectedSchool.sId ?? '';
                              controller.selectedSchoolName(
                                  selectedSchool.schoolString ?? '');
                              await authController
                                  .fetchUserGradeAndSectionDetails(
                                      controller.schoolNameTextController.text);
                              context.loaderOverlay.hide();
                            },
                            selectedItem: controller.selectedSchoolName.value,
                          ),
                        ),
                      ),
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
                            items: authController.fetchUserGrade
                                .map<String>(
                                    (SchoolUserGradeAndSectionList grade) =>
                                        grade.grade?.grade ?? '')
                                .toList(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                // labelText: string("label_choose_city"),
                                // hintText: string("label_search_cit_here"),
                                labelText:
                                    string("label_choose_grade_my_profile"),
                                hintText:
                                    string("hint_choose_grade_my_profile"),
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
                              final selectedGradeObject =
                                  authController.fetchUserGrade.firstWhere(
                                (grade) => grade.grade?.grade == newValue,
                                orElse: () => SchoolUserGradeAndSectionList(
                                  sId: '',
                                ),
                              );
                              controller.selectedClass(
                                  selectedGradeObject.grade?.grade ?? "");
                              controller.grade.value =
                                  selectedGradeObject.grade?.sId ?? '';
                            },
                            selectedItem: controller.selectedClass.value,
                          ),
                        ),
                      ),
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
                            items: authController.fetchUserGrade
                                .where((grade) =>
                                    grade.grade?.grade ==
                                    controller.selectedClass.value)
                                .map<List<String>>(
                                  (grade) => grade.sections ?? [],
                                )
                                .expand((sections) => sections)
                                .toList(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                // labelText: string("label_choose_city"),
                                // hintText: string("label_search_cit_here"),
                                labelText:
                                    string("label_choose_section_my_profile"),
                                hintText:
                                    string("hint_choose_section_my_profile"),
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
                              controller.section.value = newValue ?? '';
                            },
                            selectedItem: controller.section.value,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0306,
                      ),
                      Text(
                        string("label_profile_photo"),
                        style: Theme.of(context).textTheme.tsGreyMedium12,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.0102),
                      CommonImageUpload(
                        label: string("label_profile_photo"),
                        file: controller.profilePhotoFile.value,
                        selectFile: () => controller.filePicker(
                          KycDocumentType.profilePhoto,
                        ),
                        removeFile: () => controller.filePicker(
                          KycDocumentType.profilePhoto,
                          removeFile: true,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0306,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
