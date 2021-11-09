import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_covid_app/models/covid_countries.dart';
import 'package:flutter_covid_app/utils/utils.dart';
import 'package:flutter_covid_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;


class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<Country> countryList = [];
  List<Country> displayCountryList = [];

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
    displayCountryList = countryList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const AppHeader(image: 'assets/vector/doctor-team.png'),
            Container(
              // Search Countries
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 10, right: 10),
                  child: TextFormField(
                    cursorColor: Colors.black26,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Search Country',
                        hintStyle: TextStyle(color: Colors.black54)),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          displayCountryList = countryList;
                        });
                      } else {
                        List<Country> temp = countryList
                            .where((element) => element.country
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                        setState(() {
                          displayCountryList = temp;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            Divider(
              height: 20,
              indent: MediaQuery.of(context).size.width * 0.05,
              endIndent: MediaQuery.of(context).size.width * 0.05,
              color: Colors.black54,
              thickness: 0.6,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 1.1,
              child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: displayCountryList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: kBoxDecorationShadow.copyWith(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: Text(
                              displayCountryList[index].country,
                              style: kTextStyleMainText,
                            ),
                            leading: SizedBox(
                              width: 120.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Hero(
                                  tag: 'HeroCountryFlag',
                                  child: Image.network(
                                    displayCountryList[index].countryInfo.flag,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 0.0,
                                        backgroundColor: Colors.transparent,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1,
                                              padding: const EdgeInsets.only(
                                                left: 20.0,
                                                top: 100,
                                                right: 20.0,
                                                bottom: 20.0,
                                              ),
                                              margin: const EdgeInsets.only(
                                                  top: 50.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      offset:
                                                          const Offset(0, 3),
                                                      blurRadius: 5.0,
                                                    )
                                                  ]),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: 'Country: ',
                                                            style: kTextStyleSmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                displayCountryList[
                                                                        index]
                                                                    .country,
                                                            style:
                                                                kTextStyleSmall,
                                                          )
                                                        ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text:
                                                                'Total cases: ',
                                                            style: kTextStyleSmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                displayCountryList[
                                                                        index]
                                                                    .cases
                                                                    .toString(),
                                                            style:
                                                                kTextStyleSmall,
                                                          )
                                                        ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(children: <
                                                        TextSpan>[
                                                      TextSpan(
                                                        text: 'Total deaths: ',
                                                        style: kTextStyleSmall
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            displayCountryList[
                                                                    index]
                                                                .deaths
                                                                .toString(),
                                                        style: kTextStyleSmall,
                                                      )
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text:
                                                                'Today cases: ',
                                                            style: kTextStyleSmall
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                displayCountryList[
                                                                        index]
                                                                    .todayCases
                                                                    .toString(),
                                                            style:
                                                                kTextStyleSmall,
                                                          )
                                                        ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(children: <
                                                        TextSpan>[
                                                      TextSpan(
                                                        text: 'Recovered: ',
                                                        style: kTextStyleSmall
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            displayCountryList[
                                                                    index]
                                                                .recovered
                                                                .toString(),
                                                        style: kTextStyleSmall,
                                                      )
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 20.0,
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
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            2,
                                                    child: Hero(
                                                      tag: 'HeroCountryFlag',
                                                      child: Image.network(
                                                        displayCountryList[
                                                                index]
                                                            .countryInfo
                                                            .flag,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
