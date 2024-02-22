import 'dart:io';
import '../../../app/app.dart';
import 'package:file_support/file_support.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() => Get.put(HomeController());
}

class HomeController extends BaseController<DashboardRepository> {
  final userDetails = LoginDetailsResponse().obs;
  final _fileSupportPlugin = FileSupport();

  LoginDetailsResponse get userDetailsData => userDetails.value;

  final isLoading = false.obs;

  bool get isLoadingStatus => isLoading.value;

  final isPerformanceLoading = false.obs;
  final selectedIndex = 0.obs;

  final firstTimeshow = true.obs;

  bool get firstTimeshowStatus => firstTimeshow.value;

  final dashboardCarouselList = <DashboardCarousel>[].obs;
  final myActiveOlympiadList = <MyActiveOlympiadList>[].obs;
  final userAllOlympiadList = <MyActiveOlympiadList>[].obs;
  final timeSlotForQuizRegistrationList = <TimeSlotForQuizList>[].obs;
  final registrationFinalPageData = RegistrationFinalResponse().obs;
  final quizQuestionAndAnswer = QuizPracticeQuestionAndAnswerData().obs;
  final listOfQuestionsWithOption = <QuizQuestions>[].obs;
  final singleQuestionWithOption = QuizQuestions().obs;
  int totalNoOfQuestion = 0;
  int currentNumberOfQuestion = 0;

  final selectedTabIndex = 0.obs;

  String selectedTradeType = 'virtual';
  String selectedTimeFrame = 'this month';
  List<String> tradeTypes = ['virtual', 'contest', 'tenx'];
  List<String> timeFrames = [
    'this month',
    'last month',
    'previous to last month',
    'lifetime'
  ];

  void loadUserDetails() {
    userDetails(AppStorage.getUserDetails());
    loadData();

    Get.find<WalletController>().getWalletTransactionsList();
  }

  Future loadData() async {
    ///   userDetails.value = AppStorage.getUserDetails();
    await getMyActiveOlympiadDetails();
    await getUserAllOlympiadDetails();
    // await getDashboardCarousel();
  }

  Future postQuizUserInitilizationResponse(String quizId) async {
    isLoading(true);

    try {
      final RepoResponse<QuizUserInilizationResponse> response =
          await repository.fetchQuizResponse(quizId);
      if (response.data != null) {
        SnackbarHelper.showSnackbar(response.data?.status);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future getQuizQuestionAndAnswerResponse(String quizId) async {
    isLoading(true);

    try {
      final RepoResponse<QuizPracticeQuestionAndAnswerResponse> response =
          await repository.fetchQuizQuestionsAndAnswers(quizId);
      if (response.data != null) {
        quizQuestionAndAnswer(response.data?.data);
        listOfQuestionsWithOption(response.data?.data?.questions ?? []);
        singleQuestionWithOption(response.data?.data?.questions?.first);
        totalNoOfQuestion = response.data?.data?.questions?.length ?? 0;
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future saveUserProfilePhotoDetails(File? file) async {
    isLoading(true);

    Map<String, dynamic> data = {
      'profilePhoto':
          await _fileSupportPlugin.getMultiPartFromFile(file ?? File(""))
    };

    try {
      final RepoResponse<LoginDetailsResponse> response =
          await repository.uploadProfileImageinOlympiad(data);
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          final loginDetailsResponse =
              await Get.find<AuthRepository>().loginDetails();
          if (loginDetailsResponse.data != null) {
            await AppStorage.setUserDetails(loginDetailsResponse.data!);
          }
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future getFinalRegistrationPageDetails(String slotId, String quizId) async {
    isLoading(true);

    Map<String, dynamic> data = {
      'slotId': slotId,
    };

    try {
      final RepoResponse<RegistrationFinalResponse> response =
          await repository.freeRegistration(data, quizId);
      if (response.data != null) {
        registrationFinalPageData(response.data);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  // Future getDashboardCarousel() async {
  //   isLoading(true);
  //   try {
  //     final RepoResponse<DashboardCarouselResponse> response =
  //         await repository.getDashboardCarousel();
  //     if (response.data != null) {
  //       if (response.data?.status?.toLowerCase() == "success") {
  //         dashboardCarouselList(response.data?.data ?? []);
  //       }
  //     } else {
  //       SnackbarHelper.showSnackbar(response.error?.message);
  //     }
  //   } catch (e) {
  //     SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
  //   }
  //   isLoading(false);
  // }

  Future getMyActiveOlympiadDetails() async {
    isLoading(true);
    try {
      final RepoResponse<MyActiveOlympiadResponse> response =
          await repository.getMyActiveOlympiad();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          myActiveOlympiadList(response.data?.data ?? []);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future getUserAllOlympiadDetails() async {
    isLoading(true);
    try {
      final RepoResponse<MyActiveOlympiadResponse> response =
          await repository.getuserAllOlympiad();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          userAllOlympiadList(response.data?.data ?? []);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  int? totalSpotLefts() {
    int? spots = 0;
    for (TimeSlotForQuizList spot in timeSlotForQuizRegistrationList) {
      spots = (spots ?? 0) + (spot.spotLeft ?? 0);
    }
    return spots;
  }

  Future getTimeSlotForQuizRegistrationDetails(String id) async {
    isLoading(true);
    try {
      final RepoResponse<TimeSlotForQuizRegistrationResponse> response =
          await repository.getTimeSlotForQuizRegistration(id);
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          timeSlotForQuizRegistrationList(response.data?.data ?? []);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  int calculateSeatsLeft(int maxParticipants, int currentParticipants) {
    int seatsLeft = maxParticipants - currentParticipants;
    return seatsLeft;
  }
}
