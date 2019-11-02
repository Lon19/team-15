import 'package:clic_sargent_game/auth/authfunctions.dart';
import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';


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
          PlatformException exception = e;
          print(exception.code);
          if(exception.code=="ERROR_INVALID_EMAIL"){
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text('Invalid email')));
          }
          else if(exception.code=="ERROR_EMAIL_ALREADY_IN_USE"){
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text('Email already in use')));
          }
          else if(exception.code=="ERROR_WEAK_PASSWORD"){
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text('Weak password')));
          }
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
          padding: EdgeInsets.all(20),
          color: materialWhite,
          child: Form(
              key: _formKeySignUp,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                        labelText: 'Full name'
                    ),
                    textCapitalization: TextCapitalization.sentences,
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
                      labelText: 'Password'
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
                    child: PrimaryButton('Sign Up', signUpWithEmail),
                  )
                ],
              )
          )
        )
      ),
    );
  }
}