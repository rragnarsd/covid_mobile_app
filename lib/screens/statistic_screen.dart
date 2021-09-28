import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/models/covid_worldwide.dart';
import 'package:flutter_covid_app/service/api_service.dart';
import 'package:flutter_covid_app/widgets/covid_case_card.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  late Future<CovidWorldWide> jsonData;

  @override
  void initState() {
    jsonData = APIService().fetchCovid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.blue.shade900,
            child: FutureBuilder<CovidWorldWide>(
              future: jsonData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(children: [
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
                      ),
                    ]),
                  );
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
          ),
        ),
      ]),
    );
  }
}
