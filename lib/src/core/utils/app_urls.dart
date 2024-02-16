import '../../../main.dart';

class AppUrls {
  static const String stock = 'Stock';
  static const String baseURL =
      isProd ? 'https://stoxhero.com' : 'http://43.204.7.180';
  static const String apiURL = '$baseURL/api/v1';

  static const String referralWebUrl = 'https://www.stoxhero.com/?referral=';

  static const String paymentCallBackUrl =
      "https://stoxhero.com/api/v1/payment/callback";

  static const String tenxYoutubeVideoLink =
      'https://www.youtube.com/watch?v=a3_bmjv5tXQ';
  static const String appVersion = '/mobileappversion';
  static const String defaultInviteCode = "/campaign/defaultinvite";
  static const String makePayment = "/payment/makepayment";
  static const String checkPaymentStatus = "/payment/checkstatus";
  static const String addFcmToken = "/addfcmtoken";
  static const String createAccount = "/createusermobile";
  static const String verifyPhoneLogin = "/verifyphoneloginmobile";
  static const String verifyOtp = "/verifyotp";
  static const String resendSigninOtp = "/resendmobileotp";
  static const String resendSignupOtp = "/resendotp";
  static const String loginDetails = "/loginDetail";
  static const String updateUserDetails = "/userdetail/me";
  static const String readSetting = "/readsetting";
  static const String referralsActive = "/referrals/active";
  static const String referralsLeaderboard = "/referrals/leaderboard";
  static const String referralsMyRank = "/referrals/myrank";
  static const String myReferrals = "/myreferrals";
  static const String myRefferdProduct = "/referrals/referredproduct";
  static const String withdrawal = "/withdrawals";
  static const String userWalletTransactions = "/userwallet/my";
  static const String dashboardCarousel = "/carousels/home";
  static const String verifyCouponCode = "/coupons/verify";
  static const String myWithdrawals = "/withdrawals/mywithdrawals";

  static const String phoneLogin = "/schooluserlogin";

  // static const String activeCities = "/cities/active";

  static const String activeCities = "/cities/bystate";
  static const String signup = "/schoolsignup";
  static const String userActiveQuizOlympiad = "/quiz/user/my";
  static const String userAllQuizOlympiad = "/quiz/user";

  static String bookingQuizSlot(String id) => "/quiz/user/slots/$id";
  static const String schoollist = "/fetchschools";

  static String userGrade(String schoolId) => "/school/$schoolId/usergrades";
}
