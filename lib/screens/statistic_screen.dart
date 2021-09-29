import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/models/covid_worldwide.dart';
import 'package:flutter_covid_app/widgets/app_header.dart';
import 'package:flutter_covid_app/widgets/covid_case_card.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  Future<CovidWorldWide>? _allCovidCases;

  Future<CovidWorldWide> fetchCovid() async {
    final response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    if (response.statusCode == 200) {
      return CovidWorldWide.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    _allCovidCases = fetchCovid();
  }


  void _launchURL() async {
    const _url =
        'https://www.worldometers.info/coronavirus/';
    await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
         const AppHeader(image: 'assets/vector/stay-safe.png'),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'World Updates',
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<CovidWorldWide>(
            future: _allCovidCases,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CovidCaseCard(
                        text: 'Confirmed',
                        numbers: '${snapshot.data!.cases}',
                      ),
                      CovidCaseCard(
                        text: 'Today Cases',
                        numbers: '${snapshot.data!.todayCases}',
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CovidCaseCard(
                        text: 'Active Cases',
                        numbers: '${snapshot.data!.active}',
                      ),
                      CovidCaseCard(
                        text: 'Recovered',
                        numbers: '${snapshot.data!.recovered}',
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CovidCaseCard(
                        text: 'Total Tests',
                        numbers: '${snapshot.data!.tests}',
                      ),
                      CovidCaseCard(
                        text: 'Total Deaths',
                        numbers: '${snapshot.data!.deaths}',
                      ),
                    ],
                  ), const SizedBox(height: 50.0,)
                ]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Color(0xffEEEEEE),
                    )
                  ],
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
