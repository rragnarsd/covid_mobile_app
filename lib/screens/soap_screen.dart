import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_covid_app/utils/constants.dart';
import 'package:flutter_covid_app/widgets/app_header.dart';
import 'package:flutter_covid_app/widgets/rich_text_reusable.dart';
import 'package:flutter_covid_app/widgets/training_videos.dart';
import 'package:flutter_covid_app/widgets/view_more_and_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class SoapScreen extends StatelessWidget {
  const SoapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchURL() async {
      const _url =
          'https://www.youtube.com/results?search_query=handwashing+video';
      await canLaunch(_url)
          ? await launch(_url)
          : throw 'Could not launch $_url';
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(
              image: 'assets/vector/girlandmother.png',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hand-washing and hygiene',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                      'Handwashing is one of the best ways to protect yourself and your family from getting sick. Learn when and how you should wash your hands to stay healthy.',
                      style: kTextStyleMainText,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'It’s especially important to wash: ',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const RichTextReusable(
                    textOne: ' After using the restroom',
                    textTwo: ' After leaving a public place',
                    textThree: ' After coughing, or sneezing',
                  ),
                  const Divider(color: Color(0xff66D7D1), thickness: 1.0),
                  ViewMoreRowBtn(
                    text: 'Training Videos',
                    function: () => _launchURL(),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TrainingVideos(
                    textOne: 'How to...WHO technique',
                    urlOne: 'https://www.youtube.com/watch?v=IisgnbMfKvI',
                    textTwo: 'How to handwash with soap and water',
                    urlTwo: 'https://www.youtube.com/watch?v=3PmVJQUCm4E',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


