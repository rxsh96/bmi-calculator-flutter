import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/my_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);


enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    myTap: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                    color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                  ),
                ),
                Expanded(
                  child: MyCard(
                    myTap: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.venus,
                      genderText: 'FEMALE',
                    ),
                    color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              color: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    color: activeCardColor,
                  ),
                ),
                Expanded(
                  child: MyCard(
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
