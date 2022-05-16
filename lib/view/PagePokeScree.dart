import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:primera_app_curso/recursos/color_filters.dart';
import 'package:flutter/material.dart';
import 'package:primera_app_curso/models/Pokeapi.dart';
import 'package:http/http.dart' as http;

class Pokemon extends StatefulWidget {
   Pokemon({Key? key}) : super(key: key);


  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {

  int? r = 0;

// ignore: non_constant_identifier_names
void OnPressButton(){
  setState(() {
  
  });
}
//obejto espera de servidor
 Future<List<PokeApi>?> _getPokemon() async {
   
      
      Random rnd;
      int min = 1;
      int max = 450;
      rnd =  Random();
      r = min + rnd.nextInt(max - min);

   final response =  
    await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$r'));

    List<PokeApi> pokemons = [];
    if(response.statusCode== 200 ){
      //codificar información de la api 
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);
      for (var item in jsonData["forms"]) {
        pokemons.add(PokeApi(item['name'], item['url'], item['sprites']));
      }
    } else {
      throw Exception("Fallo la conexión");
    }
    return pokemons;
 }

//que se ejecute al abrir app o pantalla
 @override
  void initState() {
    super.initState();
    _getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 182, 212, 198),
        appBar: AppBar(
          title: Text('Pokemon'),
          backgroundColor: Color.fromARGB(255, 182, 212, 198),
        ),
        body: FutureBuilder(
          future: _getPokemon(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return GridView.count(
                crossAxisCount: 1,
               children: _listpoke(snapshot.data),
              );
            } else if(snapshot.hasError){
              print(snapshot.hasError);
              return const Text("Algo Fallo");
            }
             return const Text("ALGO FALLO");
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: OnPressButton,
          child: const Icon(Icons.work_off_sharp),
        ),
      ),
    );
  }

  List<Widget>  _listpoke( data){

      // int? r = 0;
      // Random rnd;
      // int min = 1;
      // int max = 450;
      // rnd =  Random();
      // r = min + rnd.nextInt(max - min);

    List<Widget> pokemos = [];
    for (var poke in data ){
      pokemos.add(Card(
      clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: NetworkImage(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$r.png',
                ),
                //  colorFilter: ColorFilters.greyscale,
                  child: InkWell(
                  onTap: () {},
              ),
                height: 250,
              fit: BoxFit.cover,
             ),
          ],
        ),
          Text(poke.name, style:  const TextStyle(fontSize: 40,color: Colors.white,shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3, 3),
                    blurRadius: 12.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  Shadow(
                    offset: Offset(5, 5),
                    blurRadius: 4,
                    color: Color.fromARGB(124, 0, 0, 0),
                  ),
                ],
          )),
          // Text(poke.url),
        ],
      )));
    }
     return pokemos;
  }
}