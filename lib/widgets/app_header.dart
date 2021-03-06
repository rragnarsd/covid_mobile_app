import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'clipper_widget.dart';

class AppHeader extends StatelessWidget {
  final String image;
  const AppHeader({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 230.0,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff403D58), Color(0xff666379)],
          ),
          image: DecorationImage(image: AssetImage(image)),
        ),
      ),
    );
  }
}
