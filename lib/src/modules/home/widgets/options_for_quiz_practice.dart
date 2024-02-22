import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stoxhero/src/app/app.dart';

class OptionsForQuizPracticsWidget extends StatelessWidget {
  // String options;
  final QuizOptions? optionsTask;
  OptionsForQuizPracticsWidget({Key? key, required this.optionsTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 50,
          // width: MediaQuery.of(context).size.width - 32,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: AppColors.lightGreen)),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  // Text(
                  //   options,
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  Radio(
                      value: optionsTask, groupValue: 2, onChanged: (value) {}),
                  if (optionsTask?.image != null) ...{
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        optionsTask?.image ?? '',
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.height * 0.10,
                      ),
                    )
                  } else ...{
                    Text(
                      optionsTask?.title ?? '',
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
    );
  }
}
