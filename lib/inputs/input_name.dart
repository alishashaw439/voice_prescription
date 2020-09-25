import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:voice_prescription/common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voice_prescription/inputs/input_age.dart';

class InputPage_name extends StatefulWidget {
  static const String id = 'name';
  const InputPage_name({Key key}) : super(key: key);

  @override
  _InputPage_nameState createState() => _InputPage_nameState();
}

class _InputPage_nameState extends State<InputPage_name> {
  SpeechRecognition _speechRecognition;
  final _store = Firestore.instance;

  bool _isAvailable = false;
  bool _isListening = false;

  String name = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => name = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'add to virtual prescription',
        backgroundColor: Colors.orange.shade900,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ageinput()),
          );
        }, //add to virtual prescription
        child: Icon(
          Icons.navigate_next,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade100,
        title: Center(
            child: Text(
          'voice prescription',
          style: Kdecoration.copyWith(
              fontStyle: FontStyle.italic, color: Colors.pink.shade300),
        )),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.green[200], Colors.white60])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Name', style: Kdecoration),
                SizedBox(
                  width: 50,
                ),
                FloatingActionButton(
                  heroTag: 'mic',
                  child: Icon(Icons.mic),
                  onPressed: () {
                    if (_isAvailable && !_isListening)
                      _speechRecognition
                          .listen(locale: "en_US")
                          .then((result) => print('$result'));
                  },
                ),
              ],
            ),
            SizedBox(height: 50),
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
                name,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.lightGreen,
              elevation: 20,
              child: Text('Save'),
              onPressed: () async {
                try {
                  await _store.collection('name').add({'pname': name});
                } catch (e) {
                  print(e);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
