import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/values/strings.dart';
import 'package:clic_sargent_game/screens/drawScreen.dart';
import 'package:clic_sargent_game/screens/landingPage.dart';

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
      home: LandingPage(),
    );
  }
}

