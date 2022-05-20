import 'package:flutter/material.dart';
import 'package:primera_app_curso/view/PagePokeScree.dart';

class PokeApi {
  final  String name;
  final  int weight;
  final  int base_experience;
  

  PokeApi({
    required this.name, 
    required this.weight,
    required this.base_experience
    });
 
  factory PokeApi.fromJson(Map<String, dynamic> json) =>
    PokeApi(
      name : json['name'],
      weight: json['weight'],
      base_experience: json['base_experience']
    );

   Map<String, dynamic> toJson()  {
      final Map<String, dynamic> data = new Map<String, dynamic>();
       data['name'] = this.name;
       data['weight'] = this.weight;
       data['base_experience'] = this.base_experience;
      return data;
    }
  }
  