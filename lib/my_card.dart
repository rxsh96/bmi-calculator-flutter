import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({@required this.color, this.cardChild, this.myTap});

  final Color color;
  final Widget cardChild;
  final Function myTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}