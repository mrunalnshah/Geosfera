import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:geosfera/data/region_class.dart';

import 'package:geosfera/data/country_class.dart';

class CountryServices {
  Region regionType;

  CountryServices({required this.regionType});

  Future<List<String>> fetchCountryList() async {
    final String jsonString = await rootBundle.loadString(
      'data/country_list.txt',
    );
    final Map<String, dynamic> countryListMap = jsonDecode(jsonString);

    List<String> countryList = [];

    if (regionType == Region.world) {
      countryList =
          countryListMap.values
              .expand((region) => List<String>.from(region))
              .toList();
    } else {
      String regionKey = regionType.toString().split('.').last.toLowerCase();
      if (countryListMap.containsKey(regionKey)) {
        countryList = List<String>.from(countryListMap[regionKey]!);
      }
    }
    return countryList;
  }

  Future<List<Country>> fetchCountryData(List<String> countryList) async {
    final String jsonString = await await rootBundle.loadString(
      'data/country_data.txt',
    );
    final Map<String, dynamic> countryData = jsonDecode(jsonString);

    List<Country> countries = [];

    for (String countryName in countryList) {
      if (countryData.containsKey(countryName)) {
        dynamic countryJson = countryData[countryName];
        countries.add(Country.fromJson(countryName, countryJson));
      }
    }
    return countries;
  }
}
