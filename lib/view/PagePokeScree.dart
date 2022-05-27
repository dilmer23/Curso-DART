import 'dart:convert';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:primera_app_curso/recursos/color_filters.dart';
import 'package:flutter/material.dart';
import 'package:primera_app_curso/models/Pokeapi.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

class Pokemon extends StatefulWidget {
   Pokemon({Key? key}) : super(key: key);


  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
//variable global Número Ramdon 
  int? r = 0;
     String? name="pokemon";


// ignore: non_constant_identifier_names
void OnPressButton(){
  setState(() {
  
  });
}
//obejto espera de servidor
 Future<PokeApi> _getPokemon() async {
      Random rnd;
      int min = 1;
      int max = 500;
      rnd =  Random();
      r = min + rnd.nextInt(max - min);

   final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$r'));
    if(response.statusCode== 200 ){
      
      //codificar información de la api 
      final jsonData = jsonDecode(response.body) ;
      var pokeModelo = PokeApi.fromJson(jsonData);
      // print(pokeModelo);
      return pokeModelo;
      
    } else {
      var pokeModelo = PokeApi(name: 'name', weight: 0, base_experience: 0,height: 0);
      return pokeModelo;
     
    }
      // return json;
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
      home: Container(
        height: MediaQuery.of(context).size.height / 2.0,
            width: MediaQuery.of(context).size.width - 20,
         
        decoration:  BoxDecoration(
           boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.6),
                  blurRadius: 10.0, 
                  spreadRadius: 0.0,
                  offset: const Offset(
                    1.0, // Move to right 10  horizontally
                  1.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
          image: const DecorationImage(
            image: AssetImage('assets/fondo2.jpg'),
            fit: BoxFit.cover,
            ),  
        ),
        child: FutureBuilder(
         future: _getPokemon(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  name = method(snapshot.data);
                  return Scaffold(
                  body: wigetPoke(snapshot.data) ,
                  backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      title: Text('$name',style:GoogleFonts.bebasNeue(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white)),
                    ),
                    floatingActionButton: FloatingActionButton(
                      onPressed: OnPressButton,
                      
                      child:  Image.asset('assets/pokeball.gif'),
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
                padding:const EdgeInsets.only(top: 150), 
                  child: const Image(image: AssetImage('assets/pokeball2.gif')),
                  alignment: Alignment.center,
                  width: 500,
                  height: 500,
                );
              },
        ),
      ),
    );
  }

 
  Widget wigetPoke(data){
    return 
        Stack(
          children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              elevation: 8,  // Change this 
              shadowColor: Colors.black,  // Change this 
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  SizedBox(
                     height: 80.0,
                    ),
                    Container(
                        width: 30,
                        height: 30,
                        decoration:  BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.6),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: const Offset(
                                1.0, // Move to right 10  horizontally
                                1.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                      ),  
                  Text(
                    data.name,style:GoogleFonts.bebasNeue(fontSize: 30.0,fontWeight: FontWeight.bold)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text("height:${data.height}",style: GoogleFonts.bebasNeue(fontSize:25,fontWeight:FontWeight.bold)),
                           decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.5,
                                 color: Colors.black26
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.5,
                                color: Colors.black26
                            ),
                          ),
                          child: Text("Weight:${data.weight}",style: GoogleFonts.bebasNeue(fontSize:25,fontWeight:FontWeight.bold)),
                        ),
                      ],
                  ),
                  Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,                   
                            width: 2.0,
                          )
                        ),
                      ),
                  Text("Experience: ${data.base_experience}",style: GoogleFonts.bebasNeue(fontSize:30,fontWeight:FontWeight.bold)),
                  Row(
                    
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   
                  ),
                    Text("Weight: ${data.weight}",style: GoogleFonts.bebasNeue(fontSize:30,fontWeight:FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                    Text("Weight: ${data.weight}",style: GoogleFonts.bebasNeue(fontSize:30,fontWeight:FontWeight.bold)),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text("height:${data.height}",style: GoogleFonts.bebasNeue(fontSize:25,fontWeight:FontWeight.bold)),
                          color: Colors.amber,
                        ),
                        Container(
                          child: Text("Weight:${data.weight}",style: GoogleFonts.bebasNeue(fontSize:25,fontWeight:FontWeight.bold)),
                          color: Colors.red,
                        ),
                      ],
                  ),
                  Text("Weight: ${data.weight}",style: GoogleFonts.bebasNeue(fontSize:30,fontWeight:FontWeight.bold)),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: FadeInImage(
             fadeInDuration: const Duration(milliseconds:300),
              placeholder: const AssetImage('assets/pokeball.gif'),
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
             image: NetworkImage('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$r.png')
            ),
          )
        ],
         
      );
  }

  String? method(data) {

    return data.name;
  }
}