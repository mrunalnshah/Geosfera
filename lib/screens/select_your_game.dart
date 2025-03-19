import 'package:flutter/material.dart';
import 'package:geosfera/data/game_class.dart';
import 'package:geosfera/services/game_selector.dart';
import 'package:geosfera/utility/button/geo_dash_button.dart';
import 'package:geosfera/utility/button/submit_button.dart';

import '../data/region_class.dart';

TextStyle titleTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 25.0,
  color: Color(0xFF00441b),
);

TextStyle playTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 22.0,
  fontWeight: FontWeight.w500,
);

TextStyle dropDownTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF227845),
);

class SelectYourGame extends StatefulWidget {
  const SelectYourGame({super.key});

  @override
  State<SelectYourGame> createState() => _SelectYourGameState();
}

class _SelectYourGameState extends State<SelectYourGame> {
  Games selectedGame = Games.guessCountryFromMap;
  Region selectedRegion = Region.world;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Select Game Type', style: titleTextStyle),
                  Container(
                    width: double.infinity,
                    child: Center(
                      child: DropdownButton(
                        iconSize: 30.0,
                        iconDisabledColor: Color(0xFF00441b),
                        iconEnabledColor: Color(0xFF247646),
                        dropdownColor: Color(0xFFe5f5e0),
                        elevation: 0,
                        value: selectedGame,
                        items:
                            Games.values.map((Games game) {
                              return DropdownMenuItem<Games>(
                                value: game,
                                child: Text(
                                  game.toString().split('.').last,
                                  style: dropDownTextStyle,
                                ),
                              );
                            }).toList(),
                        onChanged: (Games? newGame) {
                          if (newGame != null) {
                            setState(() {
                              selectedGame = newGame;
                            });
                          }
                        },
                        underline: SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Select Region', style: titleTextStyle),
                  Container(
                    width: double.infinity,

                    child: Center(
                      child: DropdownButton(
                        iconSize: 30.0,

                        iconDisabledColor: Color(0xFF00441b),
                        iconEnabledColor: Color(0xFF247646),
                        dropdownColor: Color(0xFFe5f5e0),
                        elevation: 0,
                        value: selectedRegion,
                        items:
                            Region.values.map((Region region) {
                              return DropdownMenuItem<Region>(
                                value: region,
                                child: Text(
                                  region.toString().split('.').last,
                                  style: dropDownTextStyle,
                                ),
                              );
                            }).toList(),
                        onChanged: (Region? newRegion) {
                          if (newRegion != null) {
                            setState(() {
                              selectedRegion = newRegion;
                            });
                          }
                        },
                        underline: SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: GeoDashButton(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return GameSelector(
                          gameType: selectedGame,
                          regionType: selectedRegion,
                        ).selectGame();
                      },
                    ),
                  );
                },
                child: Text('Play Now!', style: playTextStyle),
              ),
            ),
            SizedBox(height: 80.0),
          ],
        ),
      ),
    );
  }
}
