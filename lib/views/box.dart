import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

FlutterTts flutterTts = FlutterTts();

Future stop() async{
  await flutterTts.stop();
}


class Box extends StatefulWidget {
  final String text;
  const Box({Key key, this.text}) : super(key: key);

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child:dialogContent(context),
    );
  }

  dialogContent(BuildContext){
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.only(top: 100,right: 16,left: 16,bottom: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 100.0,
                offset: Offset(0.0,10.0),
              )
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Quote for You",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15,),
              Text(
                widget.text??" ",
                style: TextStyle(
                  fontSize: 17.0,
                ),

              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);

                },
                  child: Icon(Icons.arrow_back,
                  color: Colors.blue,),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
          radius: 50,
              backgroundImage: AssetImage("assets/H9KX.gif"),
        )),

      ],

    );
  }
}
