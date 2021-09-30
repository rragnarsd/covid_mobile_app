import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/widgets/app_header.dart';
import 'package:flutter_covid_app/widgets/sanitizer_images.dart';
import 'package:flutter_covid_app/widgets/view_more_and_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class SanitizerScreen extends StatelessWidget {
  SanitizerScreen({Key? key}) : super(key: key);

  List covidImages = [
    'assets/sanitize1.png',
    'assets/sanitize2.png',
    'assets/sanitize3.png',
    'assets/sanitize4.png',
  ];

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
            const AppHeader(image: 'assets/vector/sanitizer.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sanitizing and hygiene',
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
                      'WHO recommends cleaning your hands with soap and water whenever possible, as often as possible (and always when your hands are visibly soiled). Hand sanitizer can be used in addition to this or when washing isn\'t an option.',
                      style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.0,
                        height: 1.2,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  'Use sanitizer when...',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: String.fromCharCode(0x2022),
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: ' No access to water and soap'
                                                '\n',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              letterSpacing: 1.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ]),
                                    TextSpan(
                                        text: String.fromCharCode(0x2022),
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: ' For extra protection' '\n',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                        ]),
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ]),
                    const Divider(color: Color(0xff66D7D1), thickness: 1.0),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      children: [
                        ViewMoreRowBtn(
                            text: 'Advice from WHO',
                            function: () => _launchURL(),
                        ),
                        SanitizerImages(covidImages: covidImages)
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
