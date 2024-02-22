import 'package:get/route_manager.dart';

import '../../modules/modules.dart';
import 'routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoarding,
      page: () => OnBoardingView(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => SignInView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OtpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.profileDetails,
      page: () => ProfileDetailsView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.bankDetails,
      page: () => BankDetailsView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.kycDetails,
      page: () => KycDetailsView(),
      // binding: BankBinding(),
    ),
    GetPage(
      name: AppRoutes.kycVarification,
      page: () => KycVarificationView(),
      // binding: BankBinding(),
    ),
    GetPage(
      name: AppRoutes.referrals,
      page: () => ReferralsView(),
      binding: ReferralsBinding(),
    ),
    GetPage(
      name: AppRoutes.wallet,
      page: () => WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: AppRoutes.kycRadioButtonSeclection,
      page: () => KYCViewSelector(),
      // binding: AffiliateBinding(),
    ),
    GetPage(
      name: AppRoutes.finowledgeSignIn,
      page: () => FinowledgeSignInView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.finowledgeOtp,
      page: () => FinowledgeOtpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.finowledgeSignup,
      page: () => FinowledgeSignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.finowledgeLobby,
      page: () => FinowledgeLobbyView(),
      binding: FinowledgeBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetLoginPin,
      page: () => ForgetLoginPinView(),
      binding: AuthBinding(),
    ),
  ];
}
