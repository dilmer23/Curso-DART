import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen ({ Key? key }) : super(key: key);
  @override
  State<SecondScreen> createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  @override
  String flutterText = "";
// ignore: non_constant_identifier_names
int index = 0;
//arreglo de texto para el tring que actualiza el setState
List<String> Collletion =['Diego','Jesus','Javier','Dilmer']; 
  // ignore: non_constant_identifier_names
  void OnPressButton(){
    setState(() {
      flutterText = Collletion[index];
      index = index < 2 ? index + 1 : 0;
     });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('setState'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(flutterText,style: TextStyle(color: Colors.blue),),
            ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: OnPressButton,
          child: const Text('Actualizar'),
        ),
        ElevatedButton(onPressed: (){
           Navigator.pop(context);
        }, 
          child: Text("Regresar"),
          )
          ],
        ),
      ),
    );
  }
}