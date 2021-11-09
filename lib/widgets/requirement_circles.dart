import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_covid_app/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RequirementCircles extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final Function function;

  const RequirementCircles(
      {Key? key,
      required this.icon,
      required this.color,
      required this.text,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RawMaterialButton(
          elevation: 5.0,
          shape: const CircleBorder(),
          fillColor: color,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FaIcon(icon,
                size: 25.0, color: Theme.of(context).iconTheme.color,
            ),
          ),
          onPressed: () {
            function();
          }),
      const SizedBox(
        height: 10.0,
      ),
      Text(
        text,
        style: kTextStyleSmall.copyWith(fontWeight: FontWeight.w500,
        )
      )
    ]);
  }
}
