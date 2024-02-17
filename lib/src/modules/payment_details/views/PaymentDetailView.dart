import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'dart:math' as math;
import '../../../app/app.dart';
import '../../../utils/common_utils.dart';

class PaymentDetailView extends StatefulWidget {
  @override
  _PaymentDetailViewState createState() => _PaymentDetailViewState();
}

class _PaymentDetailViewState extends State<PaymentDetailView>
    with SingleTickerProviderStateMixin {
  late HomeController controller;
  String body = "";
  String callBackUrl = AppUrls.paymentCallBackUrl;
  String checksum = "";

  Map<String, String> headers = {};
  String environment = 'SANDBOX';
  bool enableLogs = true;
  Object? result;
  String appId = "";
  String saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
  String merchantId = "MERCHANTUAT";
  String packageName = "com.phonepe.simulator";
  String apiEndpoint = "/pg/v1/pay";
  String saltIndex = "1";
  bool paymentStatus = false;

  @override
  void initState() {
    super.initState();
    controller = Get.find<HomeController>();
    initPaymentSDK();
  }

  /// Generate Checksum
  String generateSha256Hash(String input) {
    var bytes = utf8.encode(input);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Phone Pe Initialization
  Future initPaymentSDK() async {
    await PhonePePaymentSdk.init(
      environment,
      appId,
      merchantId,
      true,
    )
        .then((isInitialized) => {
              setState(() {
                result = 'PhonePe SDK Initialized - $isInitialized';
                print(result);
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });

    String signature =
        await PhonePePaymentSdk.getPackageSignatureForAndroid() ?? '';
    print('Signature : $signature');
  }

  /// Generate Unique Merchant Transaction Id
  String generateUniqueTransactionId() {
    const int maxLength = 36;
    const String allowedCharacters = "0123456789";

    String timestampPart =
        "mtid" + DateTime.now().millisecondsSinceEpoch.toString();
    int remainingLength = maxLength - timestampPart.length;
    String randomChars = List.generate(remainingLength, (index) {
      return allowedCharacters[math.Random().nextInt(allowedCharacters.length)];
    }).join('');

    return timestampPart + randomChars;
  }

  /// Start Phone-pe Payment Intent
  void startPaymentTransaction(BuildContext context) async {
    controller.isLoading(true);
    FocusScope.of(context).unfocus();
    LoginDetailsResponse userDetails = AppStorage.getUserDetails();
    String mtId = generateUniqueTransactionId();
    String muId = 'muid${userDetails.sId}';
    String mobile = userDetails.mobile ?? '';

    await startPhonePePayment();


    await generatePaymentData(mtId, muId, mobile);
    if (paymentStatus) {
      SnackbarHelper.showSnackbar('Transaction successful');
    } else {
      SnackbarHelper.showSnackbar('Transaction failed');
    }
  }

  Future generatePaymentData(String mtId, String muId, String mobile) async {
    num amount = 1000;

    final data = {
      "merchantId": merchantId,
      "merchantTransactionId": mtId,
      "merchantUserId": muId,
      "amount": amount,
      "callbackUrl": callBackUrl,
      "mobileNumber": mobile,
      "paymentInstrument": {
        "type": "PAY_PAGE",
      }
    };

    print('PaymentData : $data');

    String jsonString = jsonEncode(data);
    String base64Data = jsonString.toBase64;
    String dataToHash = base64Data + apiEndpoint + saltKey;
    String sHA256 = generateSha256Hash(dataToHash);

    print(base64Data);
    print("$sHA256###$saltIndex");

    body = base64Data;
    checksum = "$sHA256###$saltIndex";

    setState(() {});
  }

  Future startPhonePePayment() async {
    try {
      await PhonePePaymentSdk.startTransaction(
        body,
        callBackUrl,
        checksum,
        "",
      )
          .then((response) => {
                setState(() {
                  paymentStatus = false;
                  if (response != null) {
                    print(response);
                    String status = response['status'].toString();
                    String error = response['error'].toString();
                    if (status == 'SUCCESS') {
                      paymentStatus = true;
                      result = "Flow Completed - Status: Success!";
                    } else {
                      result =
                          "Flow Completed - Status: $status and Error: $error";
                    }
                  } else {
                    result = "Flow Incomplete";
                  }
                })
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    } catch (error) {
      handleError(error);
    }
  }

  void handleError(error) {
    setState(() {
      if (error is Exception) {
        result = error.toString();
      } else {
        result = {"error": error};
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    throw Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
              child: CommonFilledButton(
                backgroundColor:
                    Get.isDarkMode ? AppColors.darkGreen : AppColors.lightGreen,
                isLoading: controller.isLoadingStatus,
                label: "Pay ",
                onPressed: () {
                  startPaymentTransaction(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
