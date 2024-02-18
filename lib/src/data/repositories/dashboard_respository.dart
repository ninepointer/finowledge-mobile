import 'dart:io';

import '../../base/base.dart';
import '../../core/core.dart';
import '../data.dart';

class DashboardRepository extends BaseRepository {
  Future<RepoResponse<DashboardCarouselResponse>> getDashboardCarousel() async {
    String apiURL = AppUrls.dashboardCarousel;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: DashboardCarouselResponse.fromJson(response));
  }

  Future<RepoResponse<TimeSlotForQuizRegistrationResponse>>
      getTimeSlotForQuizRegistration(String id) async {
    String apiURL = AppUrls.bookingQuizSlot(id);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(
            data: TimeSlotForQuizRegistrationResponse.fromJson(response));
  }

  Future<RepoResponse<MyActiveOlympiadResponse>> getMyActiveOlympiad() async {
    String apiURL = AppUrls.userActiveQuizOlympiad;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: MyActiveOlympiadResponse.fromJson(response));
  }

  Future<RepoResponse<MyActiveOlympiadResponse>> getuserAllOlympiad() async {
    String apiURL = AppUrls.userAllQuizOlympiad;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: MyActiveOlympiadResponse.fromJson(response));
  }

  Future<RepoResponse<LoginDetailsResponse>> uploadProfileImageinOlympiad(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.profilephotoUpdate;
    var response = await service.patchAuthFormData(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: LoginDetailsResponse.fromJson(response));
  }

  Future<RepoResponse<RegistrationFinalResponse>> freeRegistration(
      Map<String, dynamic> data, String quizId) async {
    String apiURL = AppUrls.registrationComplate(quizId);
    var response = await service.patchAuth(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: RegistrationFinalResponse.fromJson(response));
  }
}
