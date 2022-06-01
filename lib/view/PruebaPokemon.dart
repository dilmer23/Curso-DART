import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primera_app_curso/models/pokeApi2.dart';
import 'package:http/http.dart' as http;


class PruebaPokemon extends StatefulWidget{
   const PruebaPokemon({Key? key}) : super(key: key);

  @override
  State<PruebaPokemon> createState() => _PruebaPokemonState();
}

// ignore: camel_case_types
class _PruebaPokemonState extends State<PruebaPokemon> {

   Future<PokeApi2> getPokeRegistros() async {

   final response = await http.get(Uri.parse('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));
    if(response.statusCode== 200 ){
      final jsonData = jsonDecode(response.body) ;
      var pokeModelo = PokeApi2.fromJson(jsonData);
      print(pokeModelo);
      return pokeModelo;
      
    } else {
      var pokeModelo = PokeApi2();
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
                      crossAxisCount: 4,
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
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  PruebaPokemon()),);
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
         return listPokemon(data.pokemon);
  }

  List<Widget> listPokemon(List<Pokemon> data) {
    List<Widget> poke = [];
    
    for (var pokemon in data) {
      poke.add(Card(child:(
        Column(
         mainAxisSize: MainAxisSize.min,
          children: [
            Text(pokemon.name.toString(),style:GoogleFonts.bebasNeue(fontSize: 25.0,fontWeight: FontWeight.bold)),
             Align(
              alignment: Alignment.topCenter,
              child: FadeInImage(
               fadeInDuration: Duration(milliseconds:300),
                placeholder: AssetImage('assets/pokeball.gif'),
                height: 120.0,
                width: 120.0,
                fit: BoxFit.cover,
               image: NetworkImage(pokemon.img.toString())
              ),
            )
          ],
        )
      )));
    }

    return poke;
  }
