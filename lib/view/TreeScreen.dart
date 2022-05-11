import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TreeScreen extends StatefulWidget {
  const TreeScreen ({ Key? key }) : super(key: key);
  @override
  State<TreeScreen> createState() => _TreeScreen();
}

class _TreeScreen extends State<TreeScreen> {

  void onchangeAccion (String value){
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField"),
      ),
      body: Center(
        child: Column(
          children:  <Widget> [
            TextField(
            decoration: const InputDecoration(hintText: "Prueba"),
             onSubmitted: (String value){onchangeAccion (value);},
            )
          ],
        ),
      )
    );
  }

}