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
        countryInfo: CountryInfo.fromJson(json['countryInfo']));
  }
}

class CountryInfo {
  final String flag;

  CountryInfo({required this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(flag: json['flag']);
  }
}

/*class CountryInfo {
  String flag;

  CountryInfo({required this.flag});
  CountryInfo.fromJson(Map<String, dynamic> json) : flag = json['flag'];

  */ /*factory CountryInfo.fromJson(Map<String, dynamic> json) {
    final flag = json['flag'];
    return CountryInfo(flag: flag);
  }

  Map<String, dynamic> toJson() {
    return {
      if (flag != null) 'flag': flag,
    };
  }*/ /*
}

class Country {
  String country;
*/ /*  CountryInfo countryInfo;*/ /*
  String cases;

  Country({required this.country, */ /*required this.countryInfo,*/ /* required this.cases});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        country: json['country'],
        */ /*countryInfo: CountryInfo.fromJson(json['flag']),*/ /*
        cases: json['cases'],
    );
  }*/

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
}*/
