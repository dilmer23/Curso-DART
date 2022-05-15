import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primera_app_curso/models/Pokeapi.dart';
import 'package:http/http.dart' as http;

class Pokemon extends StatefulWidget {
  
  const Pokemon({Key? key}) : super(key: key);

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {

// ignore: non_constant_identifier_names
void OnPressButton(){
  setState(() {
  });
}
//obejto espera de servidor
 Future<List<PokeApi>?> _getPokemon() async {
   int? r = 0;
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
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pokemon'),
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
          child: const Icon(Icons.accessible),
        ),
      ),
    );
  }

  List<Widget>  _listpoke( data){

     int? r = 0;
    Random rnd;
      int min = 1;
      int max = 450;
      rnd =  Random();
      r = min + rnd.nextInt(max - min);
    List<Widget> pokemos = [];

    for (var poke in data ){
      pokemos.add(Card(child: Column(
        children: [
           Expanded(child: 
          Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$r.png',
          fit: BoxFit.fill,)),
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
