import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../base/base.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() => Get.put(AuthController());
}

class AuthController extends BaseController<AuthRepository> {
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();

  final fullNameTextController = TextEditingController();
  final parentNameTextController = TextEditingController();
  // final emailTextController = TextEditingController();
  final mobileTextController = TextEditingController();
  final otpTextController = TextEditingController();
  final dobTextController = TextEditingController();
  final schoolNameTextController = TextEditingController();

  final pinTextController = TextEditingController();

  final isLoading = false.obs;
  bool get isLoadingStatus => isLoading.value;

  final isSignup = false.obs;
  final hasCampaignCode = false.obs;
  final token = ''.obs;
  final inviteCode = CampaignCodeData().obs;
  final activeCities = <ActiveCitiesList>[].obs;
  final fetchSchool = <fetchSchoolList>[].obs;
  final fetchUserGrade = <SchoolUserGradeAndSectionList>[].obs;
  final fetchUserSection = <SchoolUserGradeAndSectionList>[].obs;
  final selectedSchoolSid = ''.obs;
  final selectedSchoolName = ''.obs;
  final campaignCode = ''.obs;

  final selectedClass = ''.obs;
  final selectedClassId = ''.obs;
  final selectedSections = <String>[].obs;
  final selectedSection = ''.obs;
  final signupPinController = TextEditingController();

  //List<String> classes = ['6th', '7th', '8th', "9th", "10th", "11th", "12th"];
  final selectedCity = ''.obs;
  final selectedCityForState = "".obs;
  final selectedInputString = ''.obs;
  final logInPinOtpController = TextEditingController();
  final forgetNewPinController = TextEditingController();
  final confirmForgetNewPinController = TextEditingController();

  List<String> states = [
    'Andaman & Nicobar',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu & Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Lakshadeep",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Pondicherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];
  final selectedState = "".obs;
  void verifyOtp() => isSignup.value ? verifySignupOtp() : verifySigninOtp();

  void showDateRangePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String date = DateFormat("dd-MM-yyyy").format(pickedDate);
      dobTextController.text = date;
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  Future userSignin() async {
    isLoading(true);
    FocusScope.of(Get.context!).unfocus();
    PhoneLoginRequest data = PhoneLoginRequest(
      mobile: mobileTextController.text,
    );
    try {
      final RepoResponse<GenericResponse> response =
          await repository.phoneLogin(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          Get.toNamed(AppRoutes.otp);
        }
      } else {
        Get.toNamed(AppRoutes.signup);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future studentSigninWithPin() async {
    isLoading(true);
    FocusScope.of(Get.context!).unfocus();
    PhoneLoginWithPinRequest data = PhoneLoginWithPinRequest(
      mobile: mobileTextController.text,
      pin: pinTextController.text,
    );
    try {
      final RepoResponse<StudentLoginWithPinResponse> response =
          await repository.studentphoneLoginWithPin(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          token(response.data?.token);
          await AppStorage.setToken(response.data?.token);
          await getUserDetails();
          // Get.toNamed(AppRoutes.home);
        }
      } else {
        // Get.toNamed(AppRoutes.signup);
        SnackbarHelper.showSnackbar("${response.error?.message}");
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future studentLoginPinReset() async {
    isLoading(true);
    FocusScope.of(Get.context!).unfocus();
    PhoneLoginRequest data = PhoneLoginRequest(
      mobile: mobileTextController.text,
    );
    try {
      final RepoResponse<GenericResponse> response =
          await repository.studentphoneLoginPinRest(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          // token(response.data?.token);
          // await AppStorage.setToken(response.data?.token);
          Get.toNamed(AppRoutes.forgetLoginPin);
        }
      } else {
        // Get.toNamed(AppRoutes.signup);
        SnackbarHelper.showSnackbar("${response.error?.message}");
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future forgetStudentLoginPinReset(Function onSuccess) async {
    isLoading(true);

    FocusScope.of(Get.context!).unfocus();

    // String deviceToken = await firebaseMessaging.getToken() ?? '-';
    // print('DeviceToken : $deviceToken');

    StudentPinResetRequest data = StudentPinResetRequest(
      mobile: mobileTextController.text,
      mobileOtp: logInPinOtpController.text,
      pin: forgetNewPinController.text,
      confirmPin: confirmForgetNewPinController.text,

      // fcmTokenData: FcmTokenData(
      //   token: deviceToken,
      // ),
    );

    try {
      final RepoResponse<GenericResponse> response =
          await repository.studentresetpin(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          onSuccess.call();
        } else {
          SnackbarHelper.showSnackbar(response.error?.message);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future verifySigninOtp() async {
    isLoading(true);

    FocusScope.of(Get.context!).unfocus();

    String deviceToken = await firebaseMessaging.getToken() ?? '-';
    print('DeviceToken : $deviceToken');

    VerifySigninRequest data = VerifySigninRequest(
      mobile: mobileTextController.text,
      mobileOtp: otpTextController.text,
      fcmTokenData: FcmTokenData(
        token: deviceToken,
      ),
    );

    try {
      final RepoResponse<VerifyPhoneLoginResponse> response =
          await repository.verifySigninOtp(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.isLogin == true) {
          if (response.data?.status?.toLowerCase() == "success") {
            token(response.data?.token);
            await AppStorage.setToken(response.data?.token);
            log('AppStorage.getToken : ${AppStorage.getToken()}');
            await getUserDetails();
            clearForm();
          } else {
            SnackbarHelper.showSnackbar(response.error?.message);
          }
        } else {
          getDefaultInviteCode();
          Get.toNamed(AppRoutes.signup);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  // Future createUserAccount() async {
  //   isLoading(true);
  //   DateTime date = DateFormat('dd-MM-yyyy').parse(dobTextController.text);
  //   SignupRequest data = SignupRequest(
  //     studentName: fullNameTextController.text,
  //     parentName: parentNameTextController.text,
  //     mobile: mobileTextController.text,
  //     dob: DateFormat('yyyy-MM-dd').format(date),
  //     school: schoolNameTextController.text,

  //     // referrerCode: hasCampaignCode.value
  //     //     ? campaignCode.value
  //     //     : referralTextController.text,
  //     campaignCode: campaignCode.value,
  //   );

  //   try {
  //     final RepoResponse<NewUserCreateAccountResponse> response =
  //         await repository.userSignup(
  //       data.toJson(),
  //     );
  //     if (response.data != null) {
  //       if (response.data?.status?.toLowerCase() == "success") {
  //         token(response.data?.token);
  //         await AppStorage.setToken(response.data?.token);
  //         log('AppStorage.getToken : ${AppStorage.getToken()}');
  //         await Future.delayed(Duration(seconds: 3));
  //         await getUserDetails();
  //         clearForm();
  //       }
  //     } else {
  //       SnackbarHelper.showSnackbar(response.error?.message);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
  //   }

  //   isLoading(false);
  // }

  Future createUserAccount() async {
    isLoading(true);
    DateTime date = DateFormat('dd-MM-yyyy').parse(dobTextController.text);

    SignupRequest data = SignupRequest(
      studentName: fullNameTextController.text,
      parentName: parentNameTextController.text,
      mobile: mobileTextController.text,
      dob: DateFormat('yyyy-MM-dd').format(date),
      school: selectedSchoolSid.value,
      grade: selectedClassId.value,
      section: selectedSection.value,
      city: selectedCity.value,
      state: selectedState.value,

      pin: signupPinController.text,

      // referrerCode: hasCampaignCode.value
      //     ? campaignCode.value
      //     : referralTextController.text,
      // campaignCode: campaignCode.value,
    );

    try {
      final RepoResponse<GenericResponse> response =
          await repository.userSignup(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          isSignup(true);
          Get.offAllNamed(AppRoutes.otp);
          SnackbarHelper.showSnackbar(response.data?.message!);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }

    isLoading(false);
  }

  Future getActiveCities(String state) async {
    isLoading(true);

    try {
      final RepoResponse<ActiveCitiesResponse> response =
          await repository.getActiveCities(state);
      if (response.data != null) {
        activeCities(response.data?.data);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future verifySignupOtp() async {
    isLoading(true);

    FocusScope.of(Get.context!).unfocus();
    String deviceToken = await firebaseMessaging.getToken() ?? '-';
    DateTime date = DateFormat('dd-MM-yyyy').parse(dobTextController.text);
    VerifySignupRequest data = VerifySignupRequest(
      studentName: fullNameTextController.text,
      parentsName: parentNameTextController.text,
      grade: selectedClassId.value,
      section: selectedSection.value,
      school: selectedSchoolSid.value,
      city: selectedCity.value,
      mobile: mobileTextController.text,
      mobileOtp: otpTextController.text,
      dob: DateFormat('yyyy-MM-dd').format(date),
      fcmTokenData: FcmTokenData(
        token: deviceToken,
      ),
      referrerCode: "",
      // referrerCode: hasCampaignCode.value
      //     ? campaignCode.value
      //     : referralTextController.text,
      campaignCode: campaignCode.value,
    );

    try {
      final RepoResponse<VerifyPhoneLoginResponse> response =
          await repository.verifySignupOtp(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          isSignup(false);
          token(response.data?.token);
          await AppStorage.setToken(response.data?.token);
          log('AppStorage.getToken : ${AppStorage.getToken()}');
          await getUserDetails();
          clearForm();
          // SnackbarHelper.showSnackbar(response.data?.message!);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future getUserDetails({bool navigate = true}) async {
    isLoading(true);
    try {
      final response = await repository.loginDetails();
      if (response.data != null) {
        await AppStorage.setUserDetails(
            response.data ?? LoginDetailsResponse());

        String deviceToken = await firebaseMessaging.getToken() ?? '-';

        FcmTokenDataRequest fcmTokenDataRequest = FcmTokenDataRequest(
          fcmTokenData: FcmTokenData(token: deviceToken),
        );

        await repository.addFcmTokenData(fcmTokenDataRequest.toJson());

        Get.find<HomeController>().loadUserDetails();
        if (navigate) {
          //await SocketService().initSocket();
          Get.offAllNamed(AppRoutes.home);
        }
        log('App ${AppStorage.getToken()}');
      } else {
        if (navigate) Get.offAllNamed(AppRoutes.signin);
        SnackbarHelper.showSnackbar(response.error?.message);
        log('App ${AppStorage.getToken()}');
        //log('App ${AppStorage.getUserDetails().toJson()}');
      }
    } catch (e) {
      log(e.toString());
      Get.offAllNamed(AppRoutes.signin);
    }
    isLoading(false);
  }

  Future resendSigninOtp() async {
    isLoading(true);

    FocusScope.of(Get.context!).unfocus();

    PhoneLoginRequest data = PhoneLoginRequest(
      mobile: mobileTextController.text,
    );

    try {
      final RepoResponse<GenericResponse> response =
          await repository.resendSigninOtp(
        data.toJson(),
      );
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          SnackbarHelper.showSnackbar(response.data?.message);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future fetchSchoolListDetails() async {
    isLoading(true);

    FocusScope.of(Get.context!).unfocus();

    fetchSchoolRequest data = fetchSchoolRequest(
        inputString: selectedInputString.value, cityId: selectedCity.value);

    try {
      //  Future<RepoResponse<fetchSchoolResponse>> response =
      //     await repository.fetchSchoolList(
      //   data.toJson(),
      // );
      final RepoResponse<fetchSchoolResponse> response =
          await repository.fetchSchoolList(
        data.toJson(),
      );
      if (response.data?.status == "success" && response.data?.data == null) {
        fetchSchoolListDetails();
      }
      if (response.data != null) {
        fetchSchool(response.data?.data ?? []);
      } else {}
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future fetchUserGradeAndSectionDetails(String schoolId) async {
    isLoading(true);
    try {
      final RepoResponse<SchoolUserGradeAndSectionResponse> response =
          await repository.getUserGrade(schoolId);
      if (response.data != null) {
        fetchUserGrade(response.data?.data ?? []);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  void updateSelectedGrade(String grade) {
    selectedClass.value = grade;
    // Find the sections for the selected grade and update selectedSections
    final selectedGradeData = fetchUserGrade.firstWhere(
      (gradeData) => gradeData.grade?.grade == grade,
      orElse: () => SchoolUserGradeAndSectionList(),
    );
    selectedSections(selectedGradeData.sections ?? []);
  }

  Future getDefaultInviteCode() async {
    isLoading(true);
    try {
      final RepoResponse<CampaignCodeResponse> response =
          await repository.getDefaultInviteCode();
      if (response.data != null) {
        inviteCode(response.data?.data);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  void clearForm() {
    fullNameTextController.clear();
    parentNameTextController.clear();
    selectedClass.value = '';
    selectedSection.value = '';
    selectedSchoolName.value = '';
    selectedCityForState.value = '';
    selectedState.value = '';
    dobTextController.clear();
  }
}
