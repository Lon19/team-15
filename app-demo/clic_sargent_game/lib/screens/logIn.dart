import 'package:clic_sargent_game/auth/authfunctions.dart';
import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LogIn extends StatefulWidget{
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn>{

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKeyLogIn = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void logInWithEmail() async{
      if(_formKeyLogIn.currentState.validate()){
        try {
          FirebaseUser user = await signIn(_emailController.text, _passwordController.text);
          Navigator.pop(context);
        } catch(e){
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text('Invalid email or password')));
        }
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Log In'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          color: materialWhite,
          child: Form(
              key: _formKeyLogIn,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'Email'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  Container(height: 30),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  Container(height: 50),
                  Container(
                    alignment: Alignment.topRight,
                    color: materialWhite,
                    child: PrimaryButton('Log In', logInWithEmail),
                  )
                ],
              )// Build this out in the next steps.
          )
        )
      ),
    );
  }
}