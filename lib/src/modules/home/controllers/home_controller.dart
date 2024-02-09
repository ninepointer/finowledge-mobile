import 'package:flutter/material.dart';

import '../../../app/app.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() => Get.put(HomeController());
}

class HomeController extends BaseController<DashboardRepository> {
  final userDetails = LoginDetailsResponse().obs;
  LoginDetailsResponse get userDetailsData => userDetails.value;

  final isLoading = false.obs;

  bool get isLoadingStatus => isLoading.value;

  final isPerformanceLoading = false.obs;
  final selectedIndex = 0.obs;

  final firstTimeshow = true.obs;
  bool get firstTimeshowStatus => firstTimeshow.value;

  final dashboardCarouselList = <DashboardCarousel>[].obs;
  final myActiveOlympiadList = <MyActiveOlympiadList>[].obs;

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
    userDetails.value = AppStorage.getUserDetails();
    getMyActiveOlympiadDetails();
    await getDashboardCarousel();
  }

  // void navigateToCarousel(String link) {
  //   if (link == 'marginxs') {
  //     selectedIndex(3);

  //     Get.find<MarginXController>().loadData();
  //     // Get.toNamed(AppRoutes.marginx);
  //     // Get.to(() => MarginXView());
  //   } else if (link == 'testzone') {
  //     selectedIndex(4);
  //     Get.find<ContestController>().loadData();
  //   } else if (link == 'tenxtrading') {
  //     selectedIndex(2);
  //     Get.find<TenxTradingController>().loadData();
  //   } else if (link == 'referrals') {
  //     Get.find<ReferralsController>().loadData();
  //     Get.toNamed(AppRoutes.referrals);
  //   } else if (link == 'wallet') {
  //     Get.find<WalletController>().loadData();
  //     Get.toNamed(AppRoutes.wallet);
  //   } else if (link == 'market') {
  //     selectedIndex(1);
  //     Get.find<VirtualTradingController>().loadData();
  //   } else if (link == 'toptestzoneportfolios') {
  //     // selectedIndex(3);
  //     Get.find<ContestProfileController>().loadData();

  //     Get.to(() => ContestTopPerformerCard());
  //   }
  // }

  String getPaidCapAmount(num fees, num cap) {
    num percentage = (fees * cap) / 100;
    return FormatHelper.formatNumbers(percentage, showDecimal: false);
  }

  // String getStockIndexName(int instId) {
  //   int index = stockIndexInstrumentList
  //       .indexWhere((element) => element.instrumentToken == instId);
  //   return stockIndexInstrumentList[index].displayName ?? '-';
  // }

  String getProductName(String? label) {
    String name = '';
    if (label == 'virtual') name = 'F&O';
    if (label == 'tenx') name = 'TenX Trading';
    if (label == 'contest') name = 'TestZones Trading';
    return name;
  }

  Color getValueColor(dynamic value) {
    if (value != null) {
      if (value is String) {
        if (value.contains('-')) {
          return AppColors.danger;
        } else if (value == '0') {
          return AppColors.success;
        }
      } else {
        num number = value is int || value is double ? value : num.parse(value);
        if (number > 0) {
          return AppColors.success;
        } else if (number < 0) {
          return AppColors.danger;
        } else if (number == 0) {
          return AppColors.success;
        }
      }
    }
    return AppColors.grey;
  }

  Future getDashboardCarousel() async {
    isLoading(true);
    try {
      final RepoResponse<DashboardCarouselResponse> response =
          await repository.getDashboardCarousel();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          dashboardCarouselList(response.data?.data ?? []);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

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

  int calculateSeatsLeft(int maxParticipants, int currentParticipants) {
    int seatsLeft = maxParticipants - currentParticipants;
    return seatsLeft;
  }
}
