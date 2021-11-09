class CovidWorldWide {
  int recovered;
  int cases;
  int todayCases;
  int deaths;
  int active;
  int tests;

  CovidWorldWide(
      {required this.recovered,
      required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.active,
      required this.tests});

  factory CovidWorldWide.fromJson(Map<String, dynamic> json) {
    return CovidWorldWide(
      recovered: json['recovered'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      active: json['active'],
      tests: json['tests'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recovered'] = recovered.toString();
    data['cases'] = cases.toString();
    data['todayCases'] = todayCases.toString();
    data['deaths'] = deaths.toString();
    data['active'] = active.toString();
    data['tests'] = active.toString();
    return data;
  }
}
