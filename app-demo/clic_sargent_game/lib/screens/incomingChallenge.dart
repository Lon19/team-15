import 'dart:io';
import 'dart:ui';

import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/values/strings.dart';
import 'package:clic_sargent_game/widgets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class IncomingChallenge extends StatefulWidget {
  final String receiverEmail;
  IncomingChallenge(this.receiverEmail);
  @override
  _IncomingChallengeState createState() => _IncomingChallengeState();
}
class _IncomingChallengeState extends State<IncomingChallenge> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}