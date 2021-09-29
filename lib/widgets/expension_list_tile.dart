import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(
        top: 0.0, bottom: 15.0, left: 15.0, right: 15.0,
      ),
      title: Text(
        hedText,
        style: const TextStyle(fontSize: 18.0),
      ),
      leading: FaIcon(icon),
      children: [
        Text(
          subText,
          style: const TextStyle(fontSize: 16.0, height: 1.2),
        )
      ],
    );
  }
}