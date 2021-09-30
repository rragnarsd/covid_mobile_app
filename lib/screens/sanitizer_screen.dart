import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/widgets/app_header.dart';
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
              child: Column(children: [
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
                                        text:
                                            ' No access to water and soap' '\n',
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
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Advice from WHO',
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
                            fontSize: 18.0,
                              color: Color(0xffFC7753)
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child:
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    shrinkWrap: true,
                    children: List.generate(
                      covidImages.length,
                          (index) => InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5, color: Colors.blue),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(3, 0),
                                ),
                              ]
                          ),
                          child: Image.asset(
                            '${covidImages[index]}',
                            fit: BoxFit.cover,
                            height: 300.0,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Material(
                                child: InkWell(
                                  child: SizedBox(
                                    //look at the orientation
                                    width: MediaQuery.of(context).size.width,
                                    child: Hero(
                                      tag: 'HeroImg',
                                      child: Image.asset('${covidImages[index]}', fit: BoxFit.fitWidth,),
                                    ),
                                  ),
                                  onTap: () => Navigator.pop(context),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ),
                )],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
