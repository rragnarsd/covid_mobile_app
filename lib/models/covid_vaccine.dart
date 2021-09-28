class CovidVaccine {
  int country;
  int timeline;

  CovidVaccine({required this.country, required this.timeline});

  factory CovidVaccine.fromJson(Map<String, dynamic> json) {
    return CovidVaccine(country: json['country'], timeline: json['timeline']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country.toString();
    data['timeline'] = timeline.toString();
    return data;
  }
}