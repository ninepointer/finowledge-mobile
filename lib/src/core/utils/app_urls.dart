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
  static const String appVersion = '$apiURL/mobileappversion';
  static const String defaultInviteCode = "$apiURL/campaign/defaultinvite";
  static const String makePayment = "$apiURL/payment/makepayment";
  static const String checkPaymentStatus = "$apiURL/payment/checkstatus";
  static const String addFcmToken = "$apiURL/addfcmtoken";
  static const String createAccount = "$apiURL/createusermobile";
  static const String verifyPhoneLogin = "$apiURL/verifyphoneloginmobile";
  static const String verifyOtp = "$apiURL/verifyotp";
  static const String resendSigninOtp = "$apiURL/resendmobileotp";
  static const String resendSignupOtp = "$apiURL/resendotp";
  static const String loginDetails = "$apiURL/loginDetail";
  static const String updateUserDetails = "$apiURL/userdetail/me";
  static const String readSetting = "$apiURL/readsetting";
  static const String referralsActive = "$apiURL/referrals/active";
  static const String referralsLeaderboard = "$apiURL/referrals/leaderboard";
  static const String referralsMyRank = "$apiURL/referrals/myrank";
  static const String myReferrals = "$apiURL/myreferrals";
  static const String myRefferdProduct = "$apiURL/referrals/referredproduct";
  static const String withdrawal = "$apiURL/withdrawals";
  static const String userWalletTransactions = "$apiURL/userwallet/my";
  static const String dashboardCarousel = "$apiURL/carousels/home";
  static const String verifyCouponCode = "$apiURL/coupons/verify";
  static const String myWithdrawals = "$apiURL/withdrawals/mywithdrawals";

  static const String phoneLogin = "$apiURL/schoollogin";

  static const String activeCities = "$apiURL/cities/active";
  static const String signup = "$apiURL/schoolsignup";
  static const String userActiveQuizOlympiad = "$apiURL/quiz/user/my";
  static const String userAllQuizOlympiad = "$apiURL/quiz/user";
  static String bookingQuizSlot(String id) => "$apiURL/quiz/user/slots/$id";
  static const String schoollist = "$apiURL/fetchschools";
}
