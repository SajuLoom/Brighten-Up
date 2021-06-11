import 'dart:math';
import 'package:brighten_up/views/box.dart';
import 'package:brighten_up/widget/animatedText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  String Quote;

  FlutterTts flutterTts = FlutterTts();

  Future speak() async{
    await flutterTts.speak(Quote);
    await flutterTts.setPitch(1.5);
    await flutterTts.setSpeechRate(0.9);
  }

  Future stop() async{
    await flutterTts.stop();
  }




  getData() async{

    var response = await http.get(Uri.parse("https://api.quotesnewtab.com/v1/quotes"));
    List <dynamic> jsonData = jsonDecode(response.body);
    Random random = new Random();
    int row = random.nextInt(1225);
    Quote = jsonData[row]['quote'];
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[500],
        elevation: 15,
        centerTitle: true,
        title: Text(
          "Brighten Up",
          style: TextStyle(
            fontFamily: 'Olea',
            fontSize: 35,
          ),

        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight:Radius.circular(200), bottomLeft: Radius.circular(200))
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SizedBox(),
        ),

      ),
      body: Container(
        padding: EdgeInsets.only(left: 60),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,


          children: [
            Container(

              child: Twen(),
            ),
            Container(
              child: Text(
                "Let's Make it Shine",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight:  FontWeight.w900,
                  fontSize: 35
                ),
              ),
            ),
            SizedBox(height: 35,),
            RaisedButton(
              elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200),
                ),
                onPressed :(){

                  getData();
                  speak();
                  showDialog(context: context, builder: (context){
                    return Box(text: Quote,);
                  });
                },
              child: Text(
                'Motivate',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),

            ),
          ],
        ),

      ),
    );
  }
}
