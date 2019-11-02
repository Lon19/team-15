import 'package:clic_sargent_game/screens/gamePlayView.dart';
import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/strings.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/screens/drawScreen.dart';


class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: new AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: new Text(APP_NAME),
//      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 75,
                child: Center(
                  child: Text(
                    'I draw, you guess',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700, color: materialWhite),
                  ),
                ),
              ),
              Flexible(
                flex: 25,
                child: Center(
                  child: ButtonTheme(
                      height: 70,
                      minWidth: 350,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GamePlayView()),
                          );
                        },
                        child: Text(
                          'Play',
                          style: TextStyle(
                            color: materialWhite,
                            fontFamily: BODY_FONT,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        color: materialBlack,
                        splashColor: Colors.grey[300],
                      )
                  )
                ),
              )

            ],
          )
        )
      ),
    );
  }
}