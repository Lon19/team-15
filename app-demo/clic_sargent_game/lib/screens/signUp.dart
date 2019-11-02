import 'package:clic_sargent_game/auth/authfunctions.dart';
import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUp extends StatefulWidget{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKeySignUp = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void signUpWithEmail() async{
      if(_formKeySignUp.currentState.validate()){
        try {
          FirebaseUser user = await signUp(_emailController.text, _passwordController.text);
          addUserToDB(_emailController.text, _fullNameController.text, user.uid);
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
        title: new Text('Sign Up'),
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
                              key: _formKeySignUp,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: _fullNameController,
                                    decoration: InputDecoration(
                                        hintText: 'Full name'
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),
                                  Container(height: 30),
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
                                    child: PrimaryButton('Sign Up', signUpWithEmail),
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