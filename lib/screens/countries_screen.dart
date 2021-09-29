import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
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
                    return ListTile(
                      contentPadding: const EdgeInsets.all(5.0),
                      title: Text(countryList[i].country),
                      leading: SizedBox(
                        width: 120.0,
                        child: Image.network(
                          countryList[i].countryInfo.flag,
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0.0,
                                backgroundColor: Colors.transparent,
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20.0,
                                          top: 100,
                                          right: 20.0,
                                          bottom: 20.0),
                                      margin: EdgeInsets.only(top: 50.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0, 5),
                                              blurRadius: 10.0,
                                            )
                                          ]),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(text: 'Country: ', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
                                                  TextSpan(text: countryList[i].country, style: TextStyle(color: Colors.black))
                                                ]
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(text: 'Total cases: ', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
                                                TextSpan(text: countryList[i].cases.toString(), style: TextStyle(color: Colors.black))
                                              ]
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            'Today cases: ${countryList[i].todayCases.toString()}',
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            'Total deaths: ${countryList[i].deaths.toString()}',
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            'Recovered: ${countryList[i].recovered.toString()}',
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 20,
                                      right: 20,
                                      child: CircleAvatar(
                                        radius: 45,
                                        backgroundColor: Colors.transparent,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(0.0),
                                          ),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            child: Image.network(
                                              countryList[i].countryInfo.flag,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
