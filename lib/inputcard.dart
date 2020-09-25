import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:voice_prescription/common.dart';

class InputCard extends StatelessWidget {
  final String tag;
  final String tagforHero;
  final Function press;
  final String vtext;
  final Function gotonext;
  

  InputCard({@required this.tag,this.press,this.tagforHero,this.vtext,@required this.gotonext});

 
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tagforHero,
          child: Card(

        margin: EdgeInsets.all(3),
        elevation: 10,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  tag,
                  style: Kdecoration,
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: press,
                  
                  mini: true,
                  child: Icon(Icons.mic),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent[100],
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 40.0,
                  ),
                  child: Text(
                    vtext,
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),

                SizedBox(height: 20,),
                Center(
                  child: FloatingActionButton(
                    onPressed: gotonext,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}