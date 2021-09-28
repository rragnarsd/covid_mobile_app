class CountryInfo {
  final String flag;

  CountryInfo({required this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    final flag = json['flag'];
    return CountryInfo(flag: flag);
  }

  Map<String, dynamic> toJson() {
    return {
      if (flag != null) 'flag': flag,
    };
  }
}

class Country {
  final String country;
  final CountryInfo countryInfo;
  final String cases;

  Country({required this.country, required this.countryInfo, required this.cases});

  factory Country.fromJson(dynamic json) {
    return Country(
        country: json['country'].toString(),
        countryInfo: CountryInfo.fromJson(json['countryInfo']),
        cases: json['cases'].toString(),
    );
  }

/*
class Country {
  String country;
  String cases;
  String deaths;
  String recovered;
  String todayCases;
  CountryInfo countryInfo;

  Country.fromJson(Map<String, dynamic> json)
      : country = json['country'].toString(),
        cases = json['cases'].toString(),
        deaths = json['deaths'].toString(),
        recovered = json['recovered'].toString(),
        todayCases = json['todayCases'].toString(),
        countryInfo = CountryInfo.fromJson(json['flag']);
}

class CountryInfo {
  String flag;

  CountryInfo.fromJson(Map<String, dynamic> json) : flag = json['flag'];
}
*/
}