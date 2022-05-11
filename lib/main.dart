import 'package:flutter/material.dart';
import 'package:primera_app_curso/SecondScreen.dart';
import 'package:primera_app_curso/view/TreeScreen.dart';

void main() {
  runApp( MaterialApp(
    initialRoute: '/',
    routes: {
      '/' :(context) => FirtScreen(),
      '/second' : (context) => SecondScreen(),
      '/tree' : (context) => TreeScreen(),
    },
  ));
}


class FirtScreen extends StatelessWidget{

  final double iconSize =80;
  @override
  Widget build(BuildContext context) {
    
    String ruta;
    return Scaffold(
      appBar: AppBar(
        title: Text("Primera app"),
      ),
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            MyCard(
              titulo: Text("Diego Cerquera"),
              icono: Icon(Icons.safety_divider,size: 80,color: Colors.blue,),
            ),
             MyCard(
              titulo: Text("Jesus Pardo"),
              icono: Icon(Icons.ac_unit_outlined,size: 80,color: Colors.deepOrangeAccent,),
            ),
             MyCard(
              titulo: Text("Javier Campuzano"),
              icono: Icon(Icons.ice_skating,size: 80,)
            ),
             MyButton(
             tituloBtn: Text("Segunda Actividad"),
            ),
            // MyButton(
            //   tituloBtn: Text("Prueba 2"),
            //   ),
          ],
        ),
      )
    );
  }
}
class MyCard extends StatelessWidget {
  final Widget titulo;
  final Widget icono;
  const MyCard({required this.icono,required this.titulo});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Card(
        child: Column(
          children: <Widget>[icono,titulo],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String ruta;
  final Widget tituloBtn;
  const MyButton({this.ruta =("/second"),required this.tituloBtn});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed:() {
          Navigator.pushNamed(context,ruta);
        }, child:Column(
          children: [tituloBtn],
        ),
      ),
    );
  }   
}