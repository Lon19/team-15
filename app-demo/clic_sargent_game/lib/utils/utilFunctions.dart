import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

String getRandomWord(){
  var wordsArray = ['Sun', 'Star', 'Planet', 'Moon', 'Mobile Phone', 'Car', 'Ice Cream', 'Bird', 'Cake'];
  var rand = 0 + Random().nextInt(9 - 0);
  return wordsArray[rand];
}