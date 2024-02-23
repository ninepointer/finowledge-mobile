import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stoxhero/src/app/app.dart';

class PracticeTestForQuizView extends StatefulWidget {
  @override
  _PracticeTestForQuizViewState createState() =>
      _PracticeTestForQuizViewState();
}

class _PracticeTestForQuizViewState extends State<PracticeTestForQuizView> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.find<HomeController>();
    controller.currentNumberOfQuestion = 0;
    controller.getQuizQuestionAndAnswerResponse('65d470cf0f3ddaecf5ffca39');

    controller.optionId = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompletedQuizPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.lightGreen,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: Get.isDarkMode
                        ? AppStyles.tsWhiteRegular16
                        : AppStyles.tsWhiteRegular16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Obx(
        () => Visibility(
          visible: !controller.isLoadingStatus,
          replacement: Center(child: CircularProgressIndicator()),
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.0408),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      IntrinsicWidth(
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 6),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: AppColors.white,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "120",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(4),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 3,
                                color: AppColors.lightGreen.withOpacity(0.4),
                              )
                            ]),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "05",
                              //       style: TextStyle(
                              //         color: Colors.green,
                              //         fontSize: 20,
                              //       ),
                              //     ),
                              //     Text(
                              //       "07",
                              //       style: TextStyle(
                              //         color: Colors.red,
                              //         fontSize: 20,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              Center(
                                child: Text(
                                  "Question ${controller.currentNumberOfQuestion + 1}/${controller.totalNoOfQuestion}",
                                  style: TextStyle(color: AppColors.lightGreen),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${controller.singleQuestionWithOption.value.title}",
                                    style: Get.isDarkMode
                                        ? AppStyles.tsBlackRegular14
                                        : AppStyles.tsBlackRegular14,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (controller.singleQuestionWithOption.value
                                          .image !=
                                      null) ...{
                                    Center(
                                      child: Image.network(
                                        controller.singleQuestionWithOption
                                                .value.image ??
                                            '',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.12,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.12,
                                      ),
                                    ),
                                  }
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Obx(
                        () => Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            itemCount: controller
                                .singleQuestionWithOption.value.options?.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  if (controller.optionId.length < 1 &&
                                          controller.singleQuestionWithOption
                                                  .value.type ==
                                              QuestionType.singleCorrect.name ||
                                      controller.singleQuestionWithOption.value
                                              .type ==
                                          QuestionType
                                              .imageSingleCorrect.name) {
                                    bool? value = controller
                                            .singleQuestionWithOption
                                            .value
                                            .options?[index]
                                            .isSelected
                                            .value ??
                                        false;
                                    controller.singleQuestionWithOption.value
                                        .options?[index]
                                        .isSelected(!value);
                                    if (controller
                                            .singleQuestionWithOption
                                            .value
                                            .options?[index]
                                            .isSelected
                                            .value ==
                                        true) {
                                      controller.optionId.add(controller
                                              .singleQuestionWithOption
                                              .value
                                              .options?[index]
                                              .sId ??
                                          '');
                                    }
                                    if (controller
                                                .singleQuestionWithOption
                                                .value
                                                .options?[index]
                                                .isSelected
                                                .value ==
                                            false &&
                                        controller.optionId.contains(controller
                                            .singleQuestionWithOption
                                            .value
                                            .options?[index]
                                            .sId)) {
                                      controller.optionId.remove(controller
                                          .singleQuestionWithOption
                                          .value
                                          .options?[index]
                                          .sId);
                                    }
                                  } else if (controller.singleQuestionWithOption
                                              .value.type ==
                                          QuestionType.singleCorrect.name ||
                                      controller.singleQuestionWithOption.value
                                              .type ==
                                          QuestionType
                                              .imageSingleCorrect.name) {
                                    if (controller.optionId.length == 1) {
                                      if (controller
                                              .singleQuestionWithOption
                                              .value
                                              .options?[index]
                                              .isSelected
                                              .value ==
                                          true) {
                                        controller.singleQuestionWithOption
                                            .value.options?[index]
                                            .isSelected(false);
                                        controller.optionId = [];
                                      } else {
                                        controller.singleQuestionWithOption
                                            .value.options
                                            ?.forEach((element) {
                                          element.isSelected(false);
                                        });

                                        controller.optionId = [];
                                        bool? value = controller
                                                .singleQuestionWithOption
                                                .value
                                                .options?[index]
                                                .isSelected
                                                .value ??
                                            false;
                                        controller.singleQuestionWithOption
                                            .value.options?[index]
                                            .isSelected(!value);
                                        controller.optionId.add(controller
                                                .singleQuestionWithOption
                                                .value
                                                .options?[index]
                                                .sId ??
                                            '');
                                      }
                                    }
                                  }
                                  if (controller.singleQuestionWithOption.value
                                              .type ==
                                          QuestionType.multipleCorrect.name ||
                                      controller.singleQuestionWithOption.value
                                              .type ==
                                          QuestionType
                                              .imageMultipleCorrect.name) {
                                    bool? value = controller
                                            .singleQuestionWithOption
                                            .value
                                            .options?[index]
                                            .isSelected
                                            .value ??
                                        false;
                                    controller.singleQuestionWithOption.value
                                        .options?[index]
                                        .isSelected(!value);
                                    if (controller
                                            .singleQuestionWithOption
                                            .value
                                            .options?[index]
                                            .isSelected
                                            .value ==
                                        true) {
                                      controller.optionId.add(controller
                                              .singleQuestionWithOption
                                              .value
                                              .options?[index]
                                              .sId ??
                                          '');
                                    }
                                    if (controller
                                                .singleQuestionWithOption
                                                .value
                                                .options?[index]
                                                .isSelected
                                                .value ==
                                            false &&
                                        controller.optionId.contains(controller
                                            .singleQuestionWithOption
                                            .value
                                            .options?[index]
                                            .sId)) {
                                      controller.optionId.remove(controller
                                          .singleQuestionWithOption
                                          .value
                                          .options?[index]
                                          .sId);
                                    }
                                  }

                                  print(
                                      "selectedOption ${controller.optionId}");
                                },
                                child: OptionsForQuizPracticsWidget(
                                  optionsTask: controller
                                      .singleQuestionWithOption
                                      .value
                                      .options?[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Row(
                  children: [
                    controller.currentNumberOfQuestion == 0
                        ? Container()
                        : Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.currentNumberOfQuestion =
                                    controller.currentNumberOfQuestion - 1;
                                controller.singleQuestionWithOption(controller
                                    .listOfQuestionsWithOption
                                    .value[controller.currentNumberOfQuestion]);
                                controller.optionId = [];
                                controller
                                    .singleQuestionWithOption.value.options
                                    ?.forEach((element) {
                                  if (element.isSelected.value == true) {
                                    controller.optionId.add(element.sId ?? '');
                                  }
                                });
                                print('privous ${controller.optionId}');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.lightGreen,
                                padding: EdgeInsets.all(16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                "Preivous",
                                style: Get.isDarkMode
                                    ? AppStyles.tsWhiteRegular16
                                    : AppStyles.tsWhiteRegular16,
                              ),
                            ),
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    controller.currentNumberOfQuestion + 1 ==
                            controller.totalNoOfQuestion
                        ? Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                controller
                                    .singleQuestionWithOption.value.options
                                    ?.forEach((element) {
                                  if (element.isSelected.value == true) {
                                    controller.optionId.add(element.sId ?? '');
                                  }
                                });
                                if (controller.optionId.length > 0) {
                                  controller
                                      .sendStudentQuizQuestionResponseDetails(
                                          '65d470cf0f3ddaecf5ffca39',
                                          controller.singleQuestionWithOption
                                                  .value.sId ??
                                              '',
                                          controller.optionId);
                                  controller.optionId = [];
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.lightGreen,
                                padding: EdgeInsets.all(16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                "Submit",
                                style: Get.isDarkMode
                                    ? AppStyles.tsWhiteRegular16
                                    : AppStyles.tsWhiteRegular16,
                              ),
                            ),
                          )
                        : Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.currentNumberOfQuestion =
                                    controller.currentNumberOfQuestion + 1;
                                controller.singleQuestionWithOption(controller
                                    .listOfQuestionsWithOption
                                    .value[controller.currentNumberOfQuestion]);

                                controller
                                    .singleQuestionWithOption.value.options
                                    ?.forEach((element) {
                                  if (element.isSelected.value == true) {
                                    controller.optionId.add(element.sId ?? '');
                                  }
                                });

                                if (controller.optionId.length > 0) {
                                  controller
                                      .sendStudentQuizQuestionResponseDetails(
                                          '65d470cf0f3ddaecf5ffca39',
                                          controller.singleQuestionWithOption
                                                  .value.sId ??
                                              '',
                                          controller.optionId);
                                  controller.optionId = [];

                                  print('next ${controller.optionId}');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.lightGreen,
                                padding: EdgeInsets.all(16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                "Next",
                                style: Get.isDarkMode
                                    ? AppStyles.tsWhiteRegular16
                                    : AppStyles.tsWhiteRegular16,
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Get.isDarkMode
      //       ? AppColors.darkCardBackgroundColor
      //       : AppColors.lightCardBackgroundColor,
      //   child: Container(
      //       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      //       child: Row(
      //         children: [
      //           controller.currentNumberOfQuestion == 1
      //               ? Container()
      //               : Expanded(
      //                   child: ElevatedButton(
      //                     onPressed: () {
      //                       controller.currentNumberOfQuestion =
      //                           controller.currentNumberOfQuestion - 1;
      //                       controller.singleQuestionWithOption(controller
      //                           .listOfQuestionsWithOption
      //                           .value[controller.currentNumberOfQuestion]);
      //                     },
      //                     style: ElevatedButton.styleFrom(
      //                       primary: AppColors.lightGreen,
      //                       padding: EdgeInsets.all(16.0),
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(10.0),
      //                       ),
      //                     ),
      //                     child: Text(
      //                       "Preivous",
      //                       style: Get.isDarkMode
      //                           ? AppStyles.tsWhiteRegular16
      //                           : AppStyles.tsWhiteRegular16,
      //                     ),
      //                   ),
      //                 ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           controller.currentNumberOfQuestion ==
      //                   controller.totalNoOfQuestion
      //               ? Container()
      //               : Expanded(
      //                   child: ElevatedButton(
      //                     onPressed: () {
      //                       controller.currentNumberOfQuestion =
      //                           controller.currentNumberOfQuestion + 1;
      //                       controller.singleQuestionWithOption(controller
      //                           .listOfQuestionsWithOption
      //                           .value[controller.currentNumberOfQuestion]);

      //                       // Navigator.pushReplacement(
      //                       //     context,
      //                       //     MaterialPageRoute(
      //                       //         builder: (context) => CompletedQuizPage()));
      //                     },
      //                     style: ElevatedButton.styleFrom(
      //                       primary: AppColors.lightGreen,
      //                       padding: EdgeInsets.all(16.0),
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(10.0),
      //                       ),
      //                     ),
      //                     child: Text(
      //                       "Next",
      //                       style: Get.isDarkMode
      //                           ? AppStyles.tsWhiteRegular16
      //                           : AppStyles.tsWhiteRegular16,
      //                     ),
      //                   ),
      //                 ),
      //         ],
      //       )),
      // ),
    );
  }
}
