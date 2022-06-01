import 'package:flutter/material.dart';
import 'package:primera_app_curso/view/PruebaPokemon.dart';
import 'package:primera_app_curso/view/SecondScreen.dart';
import 'package:primera_app_curso/view/PagePokeScree.dart';
import 'package:primera_app_curso/view/TreeScreen.dart';
import 'package:primera_app_curso/view/fourScreen.dart';
import 'package:primera_app_curso/view/homePague.dart';

void main() {
  //  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // // whenever your initialization is completed, remove the splash screen:
  //   FlutterNativeSplash.remove();

  runApp( MaterialApp(
    initialRoute: '/',
    routes: {
      '/'       :(context) => homeScreenPokemon(),
      '/second' : (context) => SecondScreen(),
      '/tree'   : (context) => TreeScreen(),
      '/four'   : (context) => fourScreen(),
      '/pokemon'   : (context) => Pokemon(),
       '/pokemon2'   : (context) => PruebaPokemon(),
    },
  ));
}