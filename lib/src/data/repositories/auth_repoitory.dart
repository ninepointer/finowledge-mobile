import '../../base/base.dart';
import '../../core/core.dart';
import '../data.dart';

class AuthRepository extends BaseRepository {
  Future<RepoResponse<GenericResponse>> getAppVersion() async {
    String apiURL = AppUrls.appVersion;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> addFcmTokenData(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.addFcmToken;
    var response = await service.postAuth(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<CampaignCodeResponse>> getDefaultInviteCode() async {
    String apiURL = AppUrls.defaultInviteCode;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: CampaignCodeResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> phoneLogin(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.phoneLogin;
    var response = await service.post(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<StudentLoginWithPinResponse>> studentphoneLoginWithPin(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.studentPinLogin;
    var response = await service.post(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: StudentLoginWithPinResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> studentphoneLoginPinRest(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.studentPinReset;
    var response = await service.post(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<VerifyPhoneLoginResponse>> verifySigninOtp(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.verifyPhoneLogin;
    var response = await service.post(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: VerifyPhoneLoginResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> studentresetpin(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.studentResetPin;
    var response = await service.patch(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<VerifyPhoneLoginResponse>> verifySignupOtp(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.verifyOtp;
    var response = await service.patch(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: VerifyPhoneLoginResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> resendSigninOtp(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.resendSigninOtp;
    var response = await service.post(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  // Future<RepoResponse<List<fetchSchoolResponse>>> fetchSchoolList(
  //     Map<String, dynamic> data) async {
  //   String apiURL = AppUrls.schoollist;
  //   var response = await service.post(path: apiURL, data: data);
  //   return response is APIException
  //       ? RepoResponse(error: response)
  //       : RepoResponse(
  //           data: (response as List<dynamic>)
  //               .map((item) => fetchSchoolResponse.fromJson(item))
  //               .toList());
  // }
  Future<RepoResponse<fetchSchoolResponse>> fetchSchoolList(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.schoollist;
    var response = await service.post(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: fetchSchoolResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> resendSignupOtp(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.resendSignupOtp;
    var response = await service.patch(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<LoginDetailsResponse>> loginDetails() async {
    String apiURL = AppUrls.loginDetails;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: LoginDetailsResponse.fromJson(response));
  }

  Future<RepoResponse<ActiveCitiesResponse>> getActiveCities(
      String state) async {
    String apiURL = "${AppUrls.activeCities}/$state";
    var response = await service.getAuth(path: apiURL, data: {"state": state});

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: ActiveCitiesResponse.fromJson(response));
  }

  Future<RepoResponse<SchoolUserGradeAndSectionResponse>> getUserGrade(
      String schoolId) async {
    String apiURL = AppUrls.userGrade(schoolId);
    var response = await service.getAuth(path: apiURL);

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(
            data: SchoolUserGradeAndSectionResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> userSignup(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.signup;
    var response = await service.post(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }
}
