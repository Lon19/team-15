import 'package:clic_sargent_game/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/values/strings.dart';
import 'package:clic_sargent_game/screens/drawScreen.dart';
import 'package:clic_sargent_game/screens/landingPage.dart';

//Firebase
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: _handleRedirection(),
    );
  }

  Widget _handleRedirection(){
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LandingPage();
        }
      },
    );
  }
}

