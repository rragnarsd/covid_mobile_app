import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpansionTileList extends StatelessWidget {
  final String hedText;
  final String subText;
  final IconData icon;

  const ExpansionTileList(
      {Key? key,
      required this.hedText,
      required this.subText,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15.0,
        bottom: 0.0,
        left: 15.0,
        right: 15.0,
      ),
      decoration: kBoxDecorationShadow.copyWith(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5.0),
        ),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ExpansionTile(
        iconColor: Theme.of(context).colorScheme.secondary,
        collapsedIconColor: Theme.of(context).iconTheme.color,
        collapsedTextColor: const Color(0xff403D58),
        textColor: const Color(0xffFC7753),
        childrenPadding: const EdgeInsets.only(
          top: 0.0,
          bottom: 15.0,
          left: 15.0,
          right: 15.0,
        ),
        title: Text(
          hedText,
          style: const TextStyle(fontSize: 18.0),
        ),
        leading: FaIcon(icon),
        children: [
          Text(
            subText,
            style: kTextStyleMainText,
          )
        ],
      ),
    );
  }
}
