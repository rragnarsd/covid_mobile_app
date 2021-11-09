import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/utils/constants.dart';

class ViewMoreRowBtn extends StatelessWidget {
  final String text;
  final Function function;
  const ViewMoreRowBtn({Key? key, required this.text, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: kTextStyleMainHeading),
        TextButton(
          onPressed: () => function(),
          child: Text('View More',
              style: kTextStyleMedium.copyWith(
                color: const Color(0xffFC7753),
              ),
          ),
        ),
      ],
    );
  }
}
