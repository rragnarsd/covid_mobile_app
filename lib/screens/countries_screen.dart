import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/models/covid_countries.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_covid_app/service/api_service.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  late Future<Country> jsonData;

  @override
  void initState() {
    jsonData = APIService().fetchAllCountries();
    super.initState();
  }

/*
List data = [];
List<Country> countryList = [];

Future<List<Country>> getCountries() async {
  final response =
  await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
  data = json.decode(response.body);
  setState(() {
    countryList = data.map((json) => Country.fromJson(json)).toList();
  });
  return countryList;
 */
/* if (response.statusCode == 200) {
    return Country.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }*//*

}

@override
  void initState() {
    super.initState();
    getCountries();
  }

*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
                child: FutureBuilder<Country>(
                      future: jsonData,
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return SizedBox(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width / 2,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return Column(children: [
                                              ListTile(
                                                title: Text(
                                                    snapshot.data!.country![index]),
                                                subtitle: Text(
                                                    'Total Cases: ${snapshot.data!.cases}'),
                                               /* leading: SizedBox(
                                                  width: 100.0,
                                                  child: Image.network(
                                                    snapshot.data!.countryInfo.flag,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),*/
                                              ),
                                            ]);
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
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
                      }),
          ),
        ],
      ),
    );
  }
}
