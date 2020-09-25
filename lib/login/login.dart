import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voice_prescription/common.dart';
import 'package:voice_prescription/inputs/input_name.dart';
import 'package:voice_prescription/login/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  String email;
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.green[200], Colors.white24])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Voice Prescription', style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 50.0,
                      color: Colors.cyan,
                    )),
                    SizedBox(height: 10,),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Email can\'t be empty' : null,
                  decoration: kDecorationbox.copyWith(hintText: 'enter email')),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    //Do something with the user input.
                    id = value;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'id can\'t be empty' : null,
                  autocorrect: false,
                  decoration:
                      kDecorationbox.copyWith(hintText: 'enter certified id')),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: RaisedButton(
                            color: Colors.teal[300],
                            child: Text('Login'),
                            onPressed: () async {
                              try {
                                final existingUser =
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: id);
                                if (existingUser != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InputPage_name()));
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: RaisedButton(
                            color: Colors.tealAccent,
                            child: Text('Register'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                        color: Colors.yellowAccent,
                        child: Text(
                          'Guest',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InputPage_name()));
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
