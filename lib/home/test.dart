import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

FlutterTts flutterTts = FlutterTts();

String text = "sivaavanish";

Future speak() async{
  await flutterTts.speak(text);
  await flutterTts.setPitch(1.5);

}


class Test extends StatelessWidget {
  const Test({Key key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    speak();
    return Container(
      child: Center(child: Text("hi")),
    );
  }
}
