import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:geosfera/data/country_class.dart';
import 'package:geosfera/data/region_class.dart';
import 'package:geosfera/services/country_services.dart';
import 'package:lottie/lottie.dart';

import 'package:geosfera/utility/alert/hint_alert.dart';
import 'package:geosfera/utility/button/option_button.dart';
import 'package:geosfera/utility/button/submit_button.dart';

TextStyle hintStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Color(0xFF00441b),
  fontSize: 12.0,
);
TextStyle hintTextStyle = TextStyle(fontSize: 12.0);

TextStyle countryNameTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF62A696),
);

class GuessCountryFromCapital extends StatefulWidget {
  Region regionType;

  GuessCountryFromCapital({super.key, required this.regionType});

  @override
  State<GuessCountryFromCapital> createState() =>
      _GuessCountryFromCapitalState();
}

class _GuessCountryFromCapitalState extends State<GuessCountryFromCapital> {
  String capitalName = 'Delhi';
  String optionA = 'India';
  String optionB = 'Nepal';
  String optionC = 'Bhutan';
  String optionD = 'United States of America';

  bool optionASelected = false;
  bool optionBSelected = false;
  bool optionCSelected = false;
  bool optionDSelected = false;

  List<String> countryList = [];
  List<Country> countryData = [];
  late Country correctCountry;
  late List<Country> incorrectCountries;
  String selectedOption = '';

  bool isAnswerChecked = false;
  bool _isDataLoaded = false;

  Future<void> fetchCountryData() async {
    countryList =
        await CountryServices(regionType: widget.regionType).fetchCountryList();
    countryData = await CountryServices(
      regionType: widget.regionType,
    ).fetchCountryData(countryList);
  }

  Future<void> initQuestion() async {
    await fetchCountryData();
    generateQuestion();
    setState(() {
      _isDataLoaded = true;
    });
  }

  void generateQuestion() {
    correctCountry = (countryData..shuffle()).first;
    incorrectCountries =
        List.from(countryData)
          ..remove(correctCountry)
          ..shuffle();
    List<String> incorrectCountryNames = [
      incorrectCountries[0].name,
      incorrectCountries[1].name,
      incorrectCountries[2].name,
    ];
    List<String> options = [
      correctCountry.name,
      incorrectCountryNames[0],
      incorrectCountryNames[1],
      incorrectCountryNames[2],
    ];
    options.shuffle();

    setState(() {
      optionA = options[0];
      optionB = options[1];
      optionC = options[2];
      optionD = options[3];

      capitalName = correctCountry.capital;
    });
  }

  void checkAnswer() {
    setState(() {
      isAnswerChecked = true;
    });

    Future.delayed(Duration(seconds: 3), () {
      generateQuestion();
      setState(() {
        isAnswerChecked = false;
        selectedOption = '';
      });
    });
  }

  @override
  void initState() {
    initQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Guess Country From Capital"),
            IconButton(
              onPressed: () {
                hintDialogBox(context, Text('NO HINT.', style: hintTextStyle));
              },
              icon: Icon(Icons.help_outline_rounded),
            ),
          ],
        ),
      ),
      body:
          _isDataLoaded
              ? Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          correctCountry.capital,
                          style: countryNameTextStyle,
                        ),
                      ),
                    ),
                  ),
                  isAnswerChecked == false
                      ? Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Select Capital:',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color(0xFF00441b),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: optionASelected ? Color(0x5062A696) : null,
                              child: OptionButton(
                                onPress: () {
                                  setState(() {
                                    optionASelected = true;
                                    optionBSelected = false;
                                    optionCSelected = false;
                                    optionDSelected = false;
                                    selectedOption = optionA;
                                  });
                                },
                                text: optionA,
                              ),
                            ),
                            Container(
                              color: optionBSelected ? Color(0x5062A696) : null,

                              child: OptionButton(
                                onPress: () {
                                  setState(() {
                                    optionASelected = false;
                                    optionBSelected = true;
                                    optionCSelected = false;
                                    optionDSelected = false;
                                    selectedOption = optionB;
                                  });
                                },
                                text: optionB,
                              ),
                            ),
                            Container(
                              color: optionCSelected ? Color(0x5062A696) : null,

                              child: OptionButton(
                                onPress: () {
                                  setState(() {
                                    optionASelected = false;
                                    optionBSelected = false;
                                    optionCSelected = true;
                                    optionDSelected = false;
                                    selectedOption = optionC;
                                  });
                                },
                                text: optionC,
                              ),
                            ),
                            Container(
                              color: optionDSelected ? Color(0x5062A696) : null,

                              child: OptionButton(
                                onPress: () {
                                  setState(() {
                                    optionASelected = false;
                                    optionBSelected = false;
                                    optionCSelected = false;
                                    optionDSelected = true;
                                    selectedOption = optionD;
                                  });
                                },
                                text: optionD,
                              ),
                            ),
                          ],
                        ),
                      )
                      : Expanded(
                        flex: 3,
                        child:
                            selectedOption == correctCountry.name
                                ? Lottie.asset('data/lottie/correct.json')
                                : Column(
                                  children: [
                                    Lottie.asset('data/lottie/incorrect.json'),
                                    SizedBox(height: 20.0),
                                    Column(
                                      children: [
                                        Text(
                                          'Answer is ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xFF62A696),
                                          ),
                                        ),
                                        Text(
                                          correctCountry.name,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF62A696),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                      ),
                  if (isAnswerChecked == false)
                    Expanded(
                      flex: 1,
                      child: SubmitButton(
                        onPress:
                            selectedOption.isNotEmpty
                                ? () {
                                  checkAnswer();
                                }
                                : () {},
                      ),
                    ),
                ],
              )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
