import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/values/strings.dart';
import 'package:clic_sargent_game/draw_screen.dart';

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

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(APP_NAME),
      ),
      body: SafeArea(
        child: Container(
          color: materialWhite,
          child: Draw(),
        )
      ),
    );
  }

}

