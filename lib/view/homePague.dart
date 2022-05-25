import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  static const String id = "home_screen";
  final String uid;
  Home(this.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      body: 
       Stack(
        children: <Widget>[
          Container(
            height: 225,
            decoration: BoxDecoration(
              image: DecorationImage( image: AssetImage('assets/background.jpg'),),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.6],
                colors: [
                  Theme.of(context).primaryColor.withGreen(190),
                  Theme.of(context).primaryColor,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(
                    MediaQuery.of(context).size.width * 0.50, 18),
                bottomRight: Radius.elliptical(
                    MediaQuery.of(context).size.width * 0.50, 18),
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
                // Navigator.of(context).pushNamed(Settings.id);
              },
            ),
          ),
          // SafeArea(
          //   // child: MultiProvider(
          //   //   providers: [
          //   //     StreamProvider<QuerySnapshot>(
          //   //       create: (context) => TabsController.getUsersTabs(this.uid),
          //   //     ),
          //   //   ],
          //   //   child: TabsContainer(),
          //   // ),
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // bool flag = await Auth.isEmailVerified();
          // if (flag)
          //   Navigator.pushNamed(context, NewTab.id);
          // else
          //   _showEmailConfirmDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// // void _showEmailConfirmDialog(BuildContext context) {
// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       if (Platform.isIOS) {
// //         return CupertinoAlertDialog(
// //           title: Text("Sorry, you need to verify your email first"),
// //           content: Text("Please check your email"),
// //           actions: <Widget>[
// //             CupertinoDialogAction(
// //               child: Text("OK"),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //             CupertinoDialogAction(
// //               child: Text("Resend Email"),
// //               onPressed: () {
// //                 Auth.sendEmailVerification();
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //           ],
// //         );
// //       } else
// //         return AlertDialog(
// //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //           title: Text("Sorry, you need to verify your email first"),
// //           content: Text("Please check your email"),
// //           actions: <Widget>[
// //             FlatButton(
// //               child: Text("OK"),
// //               textColor: Colors.black87,
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //             FlatButton(
// //               child: Text("Resend Email"),
// //               textColor: Colors.black87,
// //               onPressed: () {
// //                 Auth.sendEmailVerification();
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //           ],
// //         );
// //     },
// //   );
// }