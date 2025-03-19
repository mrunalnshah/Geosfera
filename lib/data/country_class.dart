class Country {
  String name;
  String mapPath;
  String flagCode;
  String capital;
  String region;

  Country({
    required this.name,
    required this.mapPath,
    required this.flagCode,
    required this.capital,
    required this.region,
  });

  factory Country.fromJson(String name, Map<String, dynamic> json) {
    return Country(
      name: name,
      mapPath: json['mapPath'],
      flagCode: json['flagCode'],
      capital: json['capital'],
      region: json['region'],
    );
  }
}
