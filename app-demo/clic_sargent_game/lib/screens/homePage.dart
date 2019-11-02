import 'package:clic_sargent_game/screens/gameScreenHandler.dart';
import 'package:clic_sargent_game/screens/incomingChallenge.dart';
import 'package:clic_sargent_game/utils/utilFunctions.dart';
import 'package:clic_sargent_game/widgets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/strings.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/screens/drawScreen.dart';


class HomePage extends StatelessWidget{

  FirebaseUser currentUser;

  void getUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }
  @override
  Widget build(BuildContext context) {
    getUser();
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

      body: StreamBuilder(
        stream: Firestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading..");
          }
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return _buildList(context, snapshot.data.documents[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildList(BuildContext context, DocumentSnapshot document) {
    void opponentPageRoute(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Draw(getRandomWord(), currentUser.email, document['email'].toString())));
    }
    void incomingPageRoute(){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IncomingChallenge(document['email'].toString()))
      );
    }

    if(currentUser!=null){
      if(document['email']!=currentUser.email){
        return ListTile(
          title: Text(document['name']),
          subtitle: Text(document['email']),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            opponentPageRoute();
          },
        );
      }
    }
    else {
      return Container();
    }
  }
}