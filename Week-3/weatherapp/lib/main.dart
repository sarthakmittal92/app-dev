import 'package:flutter/material.dart';
import 'package:weatherapp/screens/loadingScreen.dart';
import 'package:weatherapp/screens/locationScreen.dart';
import 'package:weatherapp/screens/cityScreen.dart';
import 'package:weatherapp/screens/reloadLocation.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => Loading(),
    '/city': (context) => City(),
    '/location': (context) => MyLocation(),
    '/reload': (context) => Reload(),
  },
));