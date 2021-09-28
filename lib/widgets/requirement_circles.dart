import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RequirementCircles extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const RequirementCircles({Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RawMaterialButton(
        shape: const CircleBorder(),
        fillColor: color,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FaIcon(
            icon,
            size: 25.0,
          ),
        ),
        onPressed: () {},
      ),
      const SizedBox(height: 10.0,),
      Text(text, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),)
    ]);
  }
}
