import 'package:bmi_calculator/my_card.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    color: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    color: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              color: Color(0xFF1D1E33),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    color: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    color: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.redAccent,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 60.0,
          ),
        ],
      ),
    );
  }
}
