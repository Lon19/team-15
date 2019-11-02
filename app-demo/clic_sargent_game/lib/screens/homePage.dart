import 'package:clic_sargent_game/screens/gamePlayView.dart';
import 'package:clic_sargent_game/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/strings.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/screens/drawScreen.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(APP_NAME),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.exit_to_app),
            onPressed: (){FirebaseAuth.instance.signOut();},
          ),
        ],
      ),
      body: SafeArea(
          child: Container(
          )
      ),
    );
  }
}