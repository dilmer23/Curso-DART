import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen ({ Key? key }) : super(key: key);
  @override
  State<SecondScreen> createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  @override
  String flutterText = "Prueba";
// ignore: non_constant_identifier_names
int index = 0;
//arreglo de texto para el tring que actualiza el setState
List<String> Collletion =['Diego','Jesus','Javier','Dilmer']; 
  // ignore: non_constant_identifier_names
  void OnPressButton(){
    setState(() {
      flutterText = Collletion[index];
      index = index < 3 ? index + 1 : 0;
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
            Text(flutterText,style: const TextStyle(fontSize: 50,color:Colors.white,  shadows: <Shadow>[
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
              ),
            ),
            ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: OnPressButton,
          child: const Text('Actualizar'),
        ),
        ElevatedButton(onPressed: (){
           Navigator.pop(context);
        }, 
          child: Text("Regresar"),
          ),
           ElevatedButton(onPressed: (){
           Navigator.pushNamed(context,'/tree');
        }, 
          child: Text("FielText"),
          )
          ],
        ),
      ),
    );
  }
}