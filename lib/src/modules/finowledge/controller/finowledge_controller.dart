import 'dart:developer';

import '../../../app/app.dart';

class FinowledgeBinding implements Bindings {
  @override
  void dependencies() => Get.put(FinowledgeController());
}

class FinowledgeController extends BaseController<FinowledgeRepository> {
  final userDetails = LoginDetailsResponse().obs;

  LoginDetailsResponse get userDetailsData => userDetails.value;
  final isLoading = false.obs;

  bool get isLoadingStatus => isLoading.value;

  Future loadData() async {
    userDetails.value = AppStorage.getUserDetails();
  }
}
