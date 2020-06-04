import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Timer(Duration(seconds: 6), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.redAccent),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Icon(
                        Icons.local_hospital,
                        color: Colors.redAccent,
                        size: 50.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Quick Health Care /n Aid App",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text("The Quickest Tracker to \n  your nearest hospital",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
