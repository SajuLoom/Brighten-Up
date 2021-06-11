import 'package:flutter/material.dart';

class Twen extends StatefulWidget {
  const Twen({Key key}) : super(key: key);

  @override
  _TwenState createState() => _TwenState();
}

class _TwenState extends State<Twen> {

  String text = "Hi, I am Tina";
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      builder: (BuildContext context, int value, Widget child){
        return Text(text.substring(0,value)+ '_',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto',
          ),
        );
      },
      duration: Duration(seconds:  5),
      tween: IntTween(begin:0, end: text.length),
    );
  }
}
