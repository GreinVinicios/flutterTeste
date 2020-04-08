import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grein/screens/contact_form.dart';
import 'package:grein/screens/contacts_list.dart';
import 'package:grein/screens/dashboard.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //theme: ThemeData.dark(),
        theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary),
        ),
        home: dashboard());//
  }
}

