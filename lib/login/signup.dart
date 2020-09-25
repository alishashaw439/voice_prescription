import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voice_prescription/common.dart';
import 'package:voice_prescription/login/login.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  final _storedetails = Firestore.instance;
  bool showSpinner = false;
  String email;
  String id;
  String fname;
  String lname;
  String degree;
  String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.green[200], Colors.white24])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text('voice prescription',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 50.0,
                      color: Colors.cyan,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  fname = value;
                },
                decoration: kDecorationbox.copyWith(hintText: 'First name'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  lname = value;
                },
                decoration: kDecorationbox.copyWith(hintText: 'Last name'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  degree = value;
                },
                decoration: kDecorationbox.copyWith(hintText: 'Degree'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  address = value;
                },
                decoration: kDecorationbox.copyWith(hintText: 'Address'),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: kDecorationbox.copyWith(hintText: 'Enter email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    //Do something with the user input.
                    id = value;
                  },
                  decoration:
                      kDecorationbox.copyWith(hintText: 'Enter certified id')),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90, right: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: RaisedButton(
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.tealAccent,
                    onPressed: () async {
                      try {
                        final existingUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: id);
                        _storedetails.collection('doctorinfo').add({
                          'fname': fname,
                          'lname': lname,
                          'degree': degree,
                          'address': address
                        });

                        if (existingUser != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
