import 'package:flutter/material.dart';
import 'package:primera_app_curso/view/SecondScreen.dart';
import 'package:primera_app_curso/view/PagePokeScree.dart';
import 'package:primera_app_curso/view/TreeScreen.dart';
import 'package:primera_app_curso/view/fourScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:primera_app_curso/view/homePague.dart';

void main() {
   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // whenever your initialization is completed, remove the splash screen:
    FlutterNativeSplash.remove();

  runApp( MaterialApp(
    initialRoute: '/',
    routes: {
      '/'       :(context) => homeScreenPokemon(),
      '/second' : (context) => SecondScreen(),
      '/tree'   : (context) => TreeScreen(),
      '/four'   : (context) => fourScreen(),
      '/pokemon'   : (context) => Pokemon(),
    },
  ));
}



// class FirtScreen extends StatelessWidget{

//   final double iconSize =100;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: 225,
//             decoration: BoxDecoration(
//               image: DecorationImage( image: AssetImage('assets/pokeball2.gif'),),
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 stops: [0.1, 0.6],
//                 colors: [
//                   Theme.of(context).primaryColor.withGreen(190),
//                   Theme.of(context).primaryColor,
//                 ],
//               ),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.elliptical(
//                     MediaQuery.of(context).size.width * 0.50, 18),
//                 bottomRight: Radius.elliptical(
//                     MediaQuery.of(context).size.width * 0.50, 18),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 30,
//             right: 5,
//             child: IconButton(
//               color: Theme.of(context).accentColor,
//               icon: Icon(Icons.settings),
//               onPressed: () {
//                 Navigator.push(context,MaterialPageRoute(builder: (context) =>  Pokemon()),);
//               },
//             ),
//           ),
//         ],
//       ),
      
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//       floatingActionButton: FloatingActionButton(
//         onPressed: ()  {
//          Navigator.pushNamed(context, '/pokemon');
//         },
//         child: Icon(Icons.keyboard_tab),
//       ),
      
//     );
//   }
// }


// class MyButton extends StatelessWidget {
//   final String ruta;
//   final Widget tituloBtn;
//   const MyButton({this.ruta =('/pokemon'),required this.tituloBtn});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ElevatedButton(
//         onPressed:() {
//           Navigator.pushNamed(context,ruta);
//         }, child:Column(
//           children: [tituloBtn],
//         ),
//       ),
//     );
//   }   
// }