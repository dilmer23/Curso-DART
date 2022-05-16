import 'package:flutter/material.dart';
import 'package:primera_app_curso/view/PagePokeScree.dart';

class PokeApi {
  String? name;
  String? url;
  String? img;
  int? Aleatorio;

  PokeApi(name, url, img) {
    // ignore: prefer_initializing_formals
    this.name = name;
    // ignore: prefer_initializing_formals
    this.url = url;
    // ignore: prefer_initializing_formals
    this.img =img;
 }
}