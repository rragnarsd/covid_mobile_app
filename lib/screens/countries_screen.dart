import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app/models/covid_countries.dart';
import 'package:http/http.dart' as http;

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<Country> countryList = [];

  Future getCountries() async {
    final response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map<String, dynamic> i in data) {
          countryList.add(Country.fromJson(i));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: countryList.length,
                itemBuilder: (context, i) {
                  return Container(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(5.0),
                      title: Text(countryList[i].country),
                      leading: Container(
                        width: 120.0,
                        child: Image.network(
                          countryList[i].countryInfo.flag,
                          fit: BoxFit.cover,
                        ),
                      ), onTap: () {},
                    ),
                  );
                }),
          ),
          ),
        ],
      ),
    );
  }
}
