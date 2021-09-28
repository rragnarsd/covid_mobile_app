import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/widgets/symptoms_images.dart';

class SymptomsScreen extends StatelessWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue.shade900,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 50.0),
                            child: Text(
                              'COVID-19 affects different people in different ways. Most infected people will develop mild to moderate illness and recover without hospitalization.',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 18.0, letterSpacing: 1.0),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Text(
                                    'Common symptoms',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
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
                                          children: const [
                                            TextSpan(
                                                text: ' Fever' '\n',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    letterSpacing: 1.0)),
                                          ]),
                                      TextSpan(
                                          text: String.fromCharCode(0x2022),
                                          children: const [
                                            TextSpan(
                                                text: ' Dry cough' '\n',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    letterSpacing: 1.0)),
                                          ]),
                                      TextSpan(
                                          text: String.fromCharCode(0x2022),
                                          children: const [
                                            TextSpan(
                                              text: ' Tiredness' '\n',
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Text(
                                    'Serious symptoms',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
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
                                          children: const [
                                            TextSpan(
                                              text: ' Fever' '\n',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                letterSpacing: 1.0,
                                              ),
                                            ),
                                          ]),
                                      TextSpan(
                                          text: String.fromCharCode(0x2022),
                                          children: const [
                                            TextSpan(
                                              text: ' Dry cough' '\n',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                letterSpacing: 1.0,
                                              ),
                                            ),
                                          ]),
                                      TextSpan(
                                          text: String.fromCharCode(0x2022),
                                          children: const [
                                            TextSpan(
                                              text: ' Tiredness' '\n',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                letterSpacing: 1.0,
                                              ),
                                            ),
                                          ]),
                                    ]),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/vector/medicalstaff.png',
                              width: MediaQuery.of(context).size.width / 3.0,
                            ),
                            const Expanded(
                              child: Text(
                                'Seek immediate medical attention if you have serious symptoms. Always call before visiting your doctor or health facility. People with mild symptoms who are otherwise healthy should manage their symptoms at home.',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child:
                              const Divider(color: Colors.blue, thickness: 1.0),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Advice from WHO',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'View All',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SymptomsImages(),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
