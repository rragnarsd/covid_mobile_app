import 'dart:convert';

import 'package:flutter_covid_app/models/covid_countries.dart';
import 'package:flutter_covid_app/models/covid_vaccine.dart';
import 'package:flutter_covid_app/models/covid_worldwide.dart';
import 'package:http/http.dart' as http;

class APIService {

  Future<CovidWorldWide> fetchCovid() async {
    final response =
    await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    if (response.statusCode == 200) {
      return CovidWorldWide.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<CovidVaccine> fetchVaccine() async {
    final response = await http.get(Uri.parse(
        'https://disease.sh/v3/covid-19/vaccine/coverage/countries?lastdays=1'));
    if (response.statusCode == 200) {
      return CovidVaccine.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Country> fetchAllCountries() async {
    final response =
    await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    if (response.statusCode == 200) {
      return Country.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

}