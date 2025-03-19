import 'package:flutter/material.dart';

import 'package:geosfera/data/game_class.dart';
import 'package:geosfera/data/region_class.dart';
import 'package:geosfera/screens/games/guess_capital_from_country.dart';
import 'package:geosfera/screens/games/guess_country_from_capital.dart';
import 'package:geosfera/screens/games/guess_from_flag.dart';
import 'package:geosfera/screens/games/guess_from_map.dart';

class GameSelector {
  Games gameType;
  Region regionType;

  GameSelector({required this.gameType, required this.regionType});

  Widget selectGame() {
    if (gameType == Games.guessCountryFromMap) {
      return GuessFromMap(regionType: regionType);
    }
    if (gameType == Games.guessCountryFromFlag) {
      return GuessFromFlag(regionType: regionType);
    }
    if (gameType == Games.guessCapitalFromCountry) {
      return GuessCapitalFromCountry(regionType: regionType);
    }

    if (gameType == Games.guessCountryFromCapital) {
      return GuessCountryFromCapital(regionType: regionType);
    }
    return GuessFromMap(regionType: regionType);
  }
}
