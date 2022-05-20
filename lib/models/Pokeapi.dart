import 'package:flutter/material.dart';
import 'package:primera_app_curso/view/PagePokeScree.dart';

class PokeApi {
  final  String? name;
  final  int weight;
  final  int base_experience;
  final  int height;
  

  PokeApi({
    required this.name, 
    required this.weight,
    required this.base_experience,
    required this.height
    });
 
  factory PokeApi.fromJson(Map<String, dynamic> json) =>
    PokeApi(
      name : json['name'],
      weight: json['weight'],
      base_experience: json['base_experience'],
      height: json['height'],
    );

   Map<String, dynamic> toJson()  {
      final Map<String, dynamic> data = new Map<String, dynamic>();
       data['name'] = name;
       data['weight'] = weight;
       data['base_experience'] = base_experience;
        data['height'] = height;
      return data;
    }
  }
  