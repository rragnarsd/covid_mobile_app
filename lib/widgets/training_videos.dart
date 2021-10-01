import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/utils/constants.dart';

import '../youtube_video.dart';

class TrainingVideos extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final String urlOne;
  final String urlTwo;

  const TrainingVideos({
    Key? key, required this.textOne, required this.textTwo, required this.urlOne, required this.urlTwo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textOne,
          style: kTextStyleMedium
        ),
        const SizedBox(
          height: 10.0,
        ),
        Video(
          url: urlOne,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          textTwo,
          style: kTextStyleMedium
        ),
        const SizedBox(
          height: 10.0,
        ),
        Video(
          url: urlTwo,
        ),
        const SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}