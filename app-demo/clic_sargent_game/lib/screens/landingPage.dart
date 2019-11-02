import 'package:clic_sargent_game/screens/gamePlayView.dart';
import 'package:clic_sargent_game/screens/logIn.dart';
import 'package:clic_sargent_game/screens/signUp.dart';
import 'package:clic_sargent_game/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/strings.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/screens/drawScreen.dart';


class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    void logInRoute(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogIn()),
      );
    }

    void signUpRoute(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 80,
                child: Center(
                  child: Text(
                    'ClicSargent Game',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
                  ),
                )
              ),
              Flexible(
                  flex: 20,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: PrimaryButton('Log In', logInRoute)
                      ),
                      Expanded(
                        child: PrimaryButton('Sign Up', signUpRoute)
                      ),
                    ],
                  )
              ),
            ],
          )
        )
      ),
    );
  }
}