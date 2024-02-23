import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stoxhero/src/app/app.dart';

class OptionsForQuizPracticsWidget extends StatefulWidget {
  // String options;
  final QuizOptions? optionsTask;
  OptionsForQuizPracticsWidget({Key? key, required this.optionsTask})
      : super(key: key);

  @override
  State<OptionsForQuizPracticsWidget> createState() =>
      _OptionsForQuizPracticsWidgetState();
}

class _OptionsForQuizPracticsWidgetState
    extends State<OptionsForQuizPracticsWidget> {
  late HomeController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.find<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            // height: 50,
            // width: MediaQuery.of(context).size.width - 32,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 3,
                    color: widget.optionsTask?.isSelected.value == true
                        ? AppColors.lightGreen
                        : AppColors.grey)),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(
                  children: [
                    // Text(
                    //   options,
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    // Radio(
                    //     value: widget.optionsTask.title,
                    //     groupValue: widget.optionsTask?.isSelected.value = true,
                    //     onChanged: (value) {}),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color:
                                  widget.optionsTask?.isSelected.value == true
                                      ? AppColors.lightGreen
                                      : AppColors.grey)),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.optionsTask?.isSelected.value == true
                              ? AppColors.lightGreen
                              : AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if (widget.optionsTask?.image != null) ...{
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.network(
                          widget.optionsTask?.image ?? '',
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.height * 0.10,
                        ),
                      )
                    } else ...{
                      Text(
                        widget.optionsTask?.title ?? '',
                        style: AppStyles.tsBlackRegular14,
                      ),
                    }
                    // Flexible(
                    //   child: Text(
                    //     optionsTask,
                    //     style: AppStyles.tsBlackRegular14,
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
