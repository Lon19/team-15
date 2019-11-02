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

    void logInWithEmail(){
      if(_formKeyLogIn.currentState.validate()){
        try {
          FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
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
              child: Column(
                children: <Widget>[
                  Flexible(
                      flex: 10,
                      child: Container(color: materialWhite,)
                  ),
                  Flexible(
                      flex: 90,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: materialWhite,
                        child: Form(
                            key: _formKeyLogIn,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      hintText: 'Email'
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
                                      hintText: 'Password'
                                  ),
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
                ],
              )
          )
      ),
    );
  }
}