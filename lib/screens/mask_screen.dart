import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/widgets/app_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../youtube_video.dart';

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
                children: [
                  const Text(
                    'Make wearing a mask a normal part of being around other people. The appropriate use, storage and cleaning or disposal of masks are essential to make them as effective as possible.',
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: String.fromCharCode(0x2022),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            children: const [
                              TextSpan(
                                text:
                                    ' Clean your hands before you put your mask on, as well as before and after you take it off, and after you touch it at any time. '
                                    '\n',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.0,
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
                                text:
                                    ' Make sure it covers both your nose, mouth and chin. '
                                    '\n',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.0,
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
                                text:
                                    ' When you take off a mask, store it in a clean plastic bag, and every day either wash it if it’s a fabric mask, or dispose of a medical mask in a trash bin.'
                                    '\n',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.0,
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
                                text: ' Don’t use masks with valves.' '\n',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                  const Divider(color: Color(0xff66D7D1), thickness: 1.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Training Videos',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _launchURL();
                        },
                        child: const Text(
                          'View More',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xffFC7753)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'How to wear a medical mask',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Video(
                        url: 'https://www.youtube.com/watch?v=adB8RW4I3o4',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'How to wear a fabric mask',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Video(
                        url: 'https://www.youtube.com/watch?v=ciUniZGD4tY',
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                    ],
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
