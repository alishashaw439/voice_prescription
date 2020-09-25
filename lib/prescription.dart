import 'package:flutter/material.dart';
import 'package:voice_prescription/common.dart';

class Prescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.share),
          backgroundColor: Colors.blueGrey,
          onPressed: (){},
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Name of doctor:',
                            style: KPrescription,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Dr.Something ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text('MBBS,MS(ORTHO)'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 200),
                        child: Column(
                          children: <Widget>[
                            Text('Ph:06656565656'),
                            Text('Email:somthing@email.com'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Mahestala,Batanagar,kol-700141',
                        style: TextStyle(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: <Widget>[
                        Info(
                          keyw: 'Name:',
                          value: 'Alisha',
                        ),
                        SizedBox(width: 5,),
                      
                        Info(
                          keyw: 'Age:',
                          value: '21',
                        ),
                        SizedBox(width: 10,),
                        Info(
                          keyw: 'Gender:',
                          value: 'female',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Info(
                    keyw: 'Symptoms:',
                    value: 'fever',
                  ),
                  SizedBox(height: 30,),
                  Info(
                    keyw: 'Medicine:',
                    value: 'Paracetamol',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String keyw;
  final String value;

  Info({this.keyw, this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(keyw,style: KPrescriptioninfokey,),
        SizedBox(
          width: 10,
        ),
        Text(value,style: KPrescriptioninfo,)
      ],
    );
  }
}
