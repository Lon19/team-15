import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawScreen.dart';

class GamePlayView extends StatelessWidget{
  final String word;
  final String senderEmail;
  final String receiverEmail;
  GamePlayView(this.word, this.senderEmail, this.receiverEmail);

  @override
  Widget build(BuildContext context) {
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