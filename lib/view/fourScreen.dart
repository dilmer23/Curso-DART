import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class fourScreen extends StatefulWidget {
  const fourScreen ({ Key? key }) : super(key: key);
  @override
  State<fourScreen> createState() => _fourScreen();
}

class _fourScreen extends State<fourScreen> {

  void _ShowAlertButton (String values){
    AlertDialog dialog = AlertDialog (
      content: Text(values),
    );
    // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );

  }

  void onchangeAlert (String value){
    setState(() {
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {},
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed:  () {},
  );
      AlertDialog dialog = AlertDialog (
      content: Text(value),
       actions: [
        cancelButton,
        continueButton,
    ],
    );
    // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
      
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title:const Text("Alert Dialog"),
     ),
     body: Center(
       child: Column(
         children: <Widget>[
           TextField(
             decoration: const InputDecoration(hintText: ""),
             onSubmitted: (String value){onchangeAlert (value);},
           ),
           ElevatedButton(
            onPressed: (){},
            child: const Text("Mostrar Alerta")
            ),
         ],
       ),
     ),
   );
  }

}