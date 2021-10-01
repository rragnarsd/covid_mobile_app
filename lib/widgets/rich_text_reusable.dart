import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/utils/constants.dart';

class RichTextReusable extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final String textThree;
  const RichTextReusable(
      {Key? key,
      required this.textOne,
      required this.textTwo,
      required this.textThree})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: String.fromCharCode(0x2022),
              style: kTextStyleReusable,
              children: [
                TextSpan(
                  text: '$textOne' '\n',
                  style: kTextStyleMainText,
                ),
              ]),
          TextSpan(
              text: String.fromCharCode(0x2022),
              style: kTextStyleReusable,
              children: [
                TextSpan(
                  text: '$textTwo' '\n',
                  style: kTextStyleMainText,
                ),
              ]),
          TextSpan(
              text: String.fromCharCode(0x2022),
              style:kTextStyleReusable,
              children: [
                TextSpan(
                  text: '$textThree' '\n',
                  style: kTextStyleMainText,
                ),
              ]),
        ],
      ),
    );
  }
}
