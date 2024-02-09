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
}
