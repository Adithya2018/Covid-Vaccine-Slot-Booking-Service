import 'dart:ui';
import 'package:covid_vaccine/models/user.dart';
import 'package:covid_vaccine/screens/registration/registration.dart';
import 'package:covid_vaccine/screens/registration/slotbooking.dart';
import 'package:covid_vaccine/screens/wrapper.dart' show Wrapper;
import 'package:covid_vaccine/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        CircularProgressIndicator,
        Colors,
        MaterialApp,
        MaterialButton,
        Scaffold,
        StatelessWidget,
        ThemeData,
        Widget,
        runApp;
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';*/

/*void main() {

}//=> runApp(MyApp()); //MyApp()*/

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MaterialButton(
          highlightColor: Colors.transparent,
          splashColor: Color.fromRGBO(0, 0, 0, 0.02),
          height: 30,
          onPressed: () {
            print("tap");
            //print(MediaQuery.of(context).size);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /**/ CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.lightBlue,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Loading...",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> initialization = Firebase.initializeApp();
  /*Future initFirebaseApp() async {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    //Firebase.initializeApp();
    return _initialization;
  }*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Text("something isn't right"),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<UserData>.value(
            value: AuthService().user,
            child: MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Color(0xFFF6F6F6),
              ),
              home: Wrapper(), // aka '/'
              routes: <String, WidgetBuilder>{
                '/reg': (BuildContext context) => Registration(),
                '/sb': (BuildContext context) => Slotbooking(),
              },
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.lightBlue,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
