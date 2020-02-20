import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/my_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 150;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    myTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: MyCard(
                    myTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.venus,
                      genderText: 'FEMALE',
                    ),
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kSliderInactiveColor,
                      thumbColor: kSliderActiveColor,
                      overlayColor: kSliderActiveAlphaColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              color: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              myPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              myPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: MyCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              myPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              myPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, this.myPressed});

  final IconData iconData;
  final Function myPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(iconData),
      onPressed: myPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kIconButtonColor,
    );
  }
}
