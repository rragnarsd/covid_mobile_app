import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/widgets/widgets.dart';
import 'package:flutter_covid_app/utils/utils.dart';
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
                        //Ath?
                        style: kTextStyleMainSubHeading
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
                            //Ath?
                          style: kTextStyleMainSubHeading
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
                Divider(color: Theme.of(context).dividerTheme.color, thickness: 1.0),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Seek immediate medical attention if you have serious symptoms. Always call before visiting your doctor or health facility.',
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
                Divider(color: Theme.of(context).dividerTheme.color, thickness: 1.0),
                const SizedBox(
                  height: 10.0,
                ),
                Column(children: [
                  ViewMoreRowBtn(text: 'Advice from WHO', function: () => _launchURL()),
                  const SymptomsImages(),
                  const SizedBox(height: 40.0,),
                ]),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
