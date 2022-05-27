import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:primera_app_curso/models/PokeRegistros.dart';
import 'package:http/http.dart' as http;

import 'PagePokeScree.dart';


class homeScreenPokemon extends StatefulWidget{
   homeScreenPokemon({Key? key}) : super(key: key);

  @override
  State<homeScreenPokemon> createState() => _homeScreenPokemonState();
}

class _homeScreenPokemonState extends State<homeScreenPokemon> {
  int? r = 0;

   Future<PokeRegistros> getPokeRegistros() async {
      Random rnd;
      int min = 1;
      int max = 100;
      rnd =  Random();
      r = min + rnd.nextInt(max - min);

   final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10&offset=$r'));
    if(response.statusCode== 200 ){
      
      //codificar información de la api 
      final jsonData = jsonDecode(response.body) ;
      var pokeModelo = PokeRegistros.fromJson(jsonData);
      return pokeModelo;
      
    } else {
      var pokeModelo = PokeRegistros();
      return pokeModelo;
    }
 }
  @override
  void initState() {
    super.initState();
    getPokeRegistros();
  }
  final double iconSize =100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: <Widget>[
          Container(
          decoration:  const BoxDecoration(
            image:  DecorationImage(image:  AssetImage("assets/fondo2.jpg"), fit: BoxFit.cover,),
            
          ),
        ),
         Center(
            
            child: FutureBuilder(
         future: getPokeRegistros(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  // name = method(snapshot.data);
                  return Container(
                    padding:EdgeInsets.only(top: 100),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: 
                       widgetRegistroPoke(snapshot.data),
                     ),
                  );
                } else if(snapshot.hasError){
                  print(snapshot.hasError);
                return Container(
                  padding:EdgeInsets.only(top: 50),
                  child: Image(image: AssetImage('assets/pokeball2.gif')),
                  alignment: Alignment.center,
                    width: 500,
                    height: 500,
                );
                }
                return Container(
                // padding:const EdgeInsets.only(top: 150), 
                  child: const Image(image: AssetImage('assets/pokeball2.gif')),
                  alignment: Alignment.center,
                  width: 500,
                  height: 500,
                );
              },
        ),
        ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage( image: AssetImage('assets/pokeball2.gif'),),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.6],
                colors: [
                  Theme.of(context).backgroundColor.withGreen(80),
                  Theme.of(context).backgroundColor,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(
                    MediaQuery.of(context).size.width * 0.50, 30),
                bottomRight: Radius.elliptical(
                    MediaQuery.of(context).size.width * 0.50, 30),
              ),
            ),

          ),
          
          Positioned(
            top: 30,
            right: 5,
            child: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  Pokemon()),);
              },
            ),
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                icon:  Image.asset('assets/pokeball.gif'),
                label: Text('Pokemon'),
                style: ElevatedButton.styleFrom(
                  onPrimary:Colors.black,
                  primary: Colors.red,
                  onSurface: Colors.grey,
                  // side: BorderSide(color: Colors.white, width: 1),
                  elevation: 20,
                  minimumSize: Size(150,50),
                  shadowColor: Colors.teal,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: (){
                   Navigator.pushNamed(context, '/pokemon');
                }, 
              ) 
           ),
        ],
      ),
    );
  }
}

 List<Widget> widgetRegistroPoke(data){
   
         return listPokemon(data.results);
 
  }

  List<Widget> listPokemon(List<Results> data) {
    List<Widget> poke = [];
    

    for (var pokemon in data) {
      poke.add(Card(child:(
        Column(
         mainAxisSize: MainAxisSize.min,
          children: [
            Text(pokemon.name.toString(),style:GoogleFonts.bebasNeue(fontSize: 25.0,fontWeight: FontWeight.bold)),
            const Align(
              alignment: Alignment.topCenter,
              child: FadeInImage(
               fadeInDuration: Duration(milliseconds:300),
                placeholder: AssetImage('assets/pokeball.gif'),
                height: 120.0,
                width: 120.0,
                fit: BoxFit.cover,
               image: NetworkImage(
                 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png')
              ),
              )

          ],
        )
      )));
    }

    return poke;
  }
