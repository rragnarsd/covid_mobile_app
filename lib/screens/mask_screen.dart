import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/utils/constants.dart';
import 'package:flutter_covid_app/widgets/app_header.dart';
import 'package:flutter_covid_app/widgets/rich_text_reusable.dart';
import 'package:flutter_covid_app/widgets/training_videos.dart';
import 'package:flutter_covid_app/widgets/view_more_and_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class MaskScreen extends StatelessWidget {
  const MaskScreen({Key? key}) : super(key: key);

  void _launchURL() async {
    const _url =
        'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/when-and-how-to-use-masks';
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(image: 'assets/vector/mask.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Guideline to face masks',
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
                      'Make wearing a mask a normal part of being around other people. The appropriate use, storage and cleaning or disposal of masks are essential to make them as effective as possible.',
                      style: kTextStyleMainText,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'How to use mask...',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      RichTextReusable(
                        textOne:
                            ' Wash hand before and after touching the mask.',
                        textTwo:
                            ' Make sure it covers both your nose, mouth and chin.',
                        textThree: ' Dispose medical mask in a trash bin.',
                      ),
                    ],
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
                    textOne: 'How to wear a medical mask',
                    urlOne: 'https://www.youtube.com/watch?v=adB8RW4I3o4',
                    textTwo: 'How to wear a fabric mask',
                    urlTwo: 'https://www.youtube.com/watch?v=ciUniZGD4tY',
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
