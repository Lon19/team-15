//import 'package:clic_sargent_game/utils/utilFunctions.dart';
//import 'package:clic_sargent_game/widgets/buttons.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:clic_sargent_game/values/strings.dart';
//import 'package:clic_sargent_game/values/colours.dart';
//import 'package:clic_sargent_game/screens/drawScreen.dart';
//
//
//class GameScreenHandler extends StatefulWidget{
//  final String word;
//  final String senderEmail;
//  final String opponentEmail;
//  final String opponentName;
//  GameScreenHandler(this.word, this.senderEmail, this.opponentEmail, this.opponentName);
//
//  @override
//  _GameScreenHandlerState createState() => _GameScreenHandlerState();
//
//}
//
//class _GameScreenHandlerState extends State<GameScreenHandler>{
//
//  FirebaseUser currentUser;
//  Widget _buttonDecision;
//
//  void getUser() async {
//    currentUser = await FirebaseAuth.instance.currentUser();
//  }
//
//  @override
//  void initState(){
//    super.initState();
//
//    Firestore.instance.collection('matches')
//        .where('senderEmail', isEqualTo: widget.senderEmail)
//        .where('receiverEmail', isEqualTo: widget.opponentEmail)
//        .where('status', isEqualTo: 'started').snapshots().listen((onData){
//      if(onData.documents.length>0){
//        print('Executing...');
//        setState(() {
//          _buttonDecision = PrimaryButton('Waiting', null);
//        });
//      }
//    });
//
//    Firestore.instance.collection('matches')
//        .where('senderEmail', isEqualTo: widget.senderEmail)
//        .where('receiverEmail', isEqualTo: widget.opponentEmail)
//        .where('status', isEqualTo: 'done').snapshots().listen((onData){
//      if(onData.documents.length>0){
//        setState(() {
//          _buttonDecision = PrimaryButton('View', null);
//        });
//      }
//    });
//
//    Firestore.instance.collection('matches')
//        .where('senderEmail', isEqualTo: widget.senderEmail)
//        .where('receiverEmail', isEqualTo: widget.opponentEmail)
//        .where('status', isEqualTo: 'done').snapshots().listen((onData){
//      if(onData.documents.length==0){
//        setState(() {
//          _buttonDecision = PrimaryButton('Play', null);
//        });
//      }
//    });
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    getUser();
//    // TODO: implement build
//    return Scaffold(
//      appBar: new AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: new Text('It\'s match time'),
//      ),
//
//      body: Container(
//          child: Column(
//            children: <Widget>[
//              Container(
//                  height: 200,
//                  child: Center(
//                      child: Column(
//                        mainAxisSize: MainAxisSize.min,
//                        children: <Widget>[
//                          Text(
//                            widget.opponentName,
//                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
//                          ),
//                          Container(height: 20),
//                          Text(
//                            widget.opponentEmail,
//                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
//                          ),
//                          Container(height: 50),
//                          _buttonDecision(),
//                        ],
//                      )
//                  )
//              ),
//            ],
//          )
//      ),
//    );
//  }
//}