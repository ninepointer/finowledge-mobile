import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionsForQuizPracticsWidget extends StatelessWidget {
  String options;
  OptionsForQuizPracticsWidget({Key? key, required this.options})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: Color(0xffA42FC1))),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Text(
                    options,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Radio(value: options, groupValue: 2, onChanged: (value) {})
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
