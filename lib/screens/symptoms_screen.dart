import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/utils/constants.dart';
import 'package:flutter_covid_app/widgets/app_header.dart';
import 'package:flutter_covid_app/widgets/rich_text_reusable.dart';
import 'package:flutter_covid_app/widgets/symptoms_images.dart';
import 'package:flutter_covid_app/widgets/view_more_and_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class SymptomsScreen extends StatelessWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchURL() async {
      const _url =
          'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public';
      await canLaunch(_url)
          ? await launch(_url)
          : throw 'Could not launch $_url';
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          const AppHeader(image: 'assets/vector/medicalstaff.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(children: [
                const Text(
                  'COVID-19 affects different people in  different ways. Most infected people will develop mild to moderate illness and recover without hospitalization.',
                  style: kTextStyleMainText,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Common Symptoms',
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
                        textOne: ' Fever',
                        textTwo: ' Dry cough',
                        textThree: ' Tiredness',
                      ),
                    ],
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Serious Symptoms',
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
                          textOne: ' Breathing problems',
                          textTwo: ' Confusion',
                          textThree: ' Chest pain',
                        ),
                      ])
                ]),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider(color: Color(0xff66D7D1), thickness: 1.0),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Seek immediate medical attention if you have serious symptoms. Always call before visiting your doctor or health facility. People with mild symptoms who are otherwise healthy should manage their symptoms at home.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 7,
                        style: kTextStyleMainText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Divider(color: Color(0xff66D7D1), thickness: 1.0),
                const SizedBox(
                  height: 10.0,
                ),
                Column(children: [
                  ViewMoreRowBtn(text: 'Advice from WHO', function: () => _launchURL()),
                  const SymptomsImages(),
                ]),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
