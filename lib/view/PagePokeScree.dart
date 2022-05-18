import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:primera_app_curso/recursos/color_filters.dart';
import 'package:flutter/material.dart';
import 'package:primera_app_curso/models/Pokeapi.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class Pokemon extends StatefulWidget {
   Pokemon({Key? key}) : super(key: key);


  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
//variable global Número Ramdon 
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
      int max = 500;
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
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.cyan,
          title: Text(""),
          // title: Text(),
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
              // return const Text("Algo Fallo");
             return Container(
               padding:EdgeInsets.only(top: 50),
              child: Image(image: AssetImage('assets/pokeball2.gif')),
               alignment: Alignment.center,
              width: 500,
              height: 500,
            );
            }
            return Container(
             padding:EdgeInsets.only(top: 50), 
              child: Image(image: AssetImage('assets/pokeball2.gif')),
               alignment: Alignment.center,
              width: 500,
              height: 500,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: OnPressButton,
          
          child:  Image.asset('assets/pokeball.gif'),
        ),
      ),
    );
  }

  List<Widget>  _listpoke( data){
    List<Widget> pokemos = [];
    for (var poke in data ){
      pokemos.add(
        Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    poke.name,
                    style:
                    GoogleFonts.bebasNeue(fontSize: 30.0,fontWeight: FontWeight.bold)
                        // TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: ${poke.name}"),
                  Text("Weight: ${poke.name}"),
                    const Text("Types",style: TextStyle(fontWeight: FontWeight.bold
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  const Text("Weakness :",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  const Text("Next Evolution",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  const Text("Next Evolution",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: FadeInImage(
             fadeInDuration: Duration(milliseconds:300),
              placeholder: AssetImage('assets/pokeball.gif'),
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
             image: NetworkImage('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$r.png')
            ),
            // child: Hero(
            //     tag: Image,
            //     child: Container(
            //       height: 200.0,
            //       width: 200.0,
            //       decoration: BoxDecoration(
            //           image: DecorationImage(
            //               fit: BoxFit.cover,
            //               image: NetworkImage('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$r.png'))),
            //                 // placeholder: AssetImage('assets/cargando-loading.gif'),
            //     )),
            )
          ],
        ),
      );
    }
     return pokemos;
  }
}