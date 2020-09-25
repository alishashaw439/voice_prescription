import 'package:flutter/material.dart';
import 'package:voice_prescription/inputs/input_name.dart';
import 'package:voice_prescription/login/login.dart';


void main() => runApp(VoicePrescription());

class VoicePrescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login(),
      
    );
  }
}

