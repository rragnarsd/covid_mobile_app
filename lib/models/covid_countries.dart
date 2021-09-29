class Country {
  final String country;
  final int cases;
  final int deaths;
  final int recovered;
  final int todayCases;
  final CountryInfo countryInfo;

  Country(
      {required this.country,
      required this.cases,
      required this.deaths,
      required this.recovered,
      required this.todayCases,
      required this.countryInfo});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['country'],
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      todayCases: json['todayCases'],
      countryInfo: CountryInfo.fromJson(json['countryInfo']),
    );
  }
}

class CountryInfo {
  final String flag;

  CountryInfo({required this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(flag: json['flag']);
  }
}
