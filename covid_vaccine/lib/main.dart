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

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  /*Future initFirebaseApp() async {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    //Firebase.initializeApp();
    return _initialization;
  }*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
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
              theme: new ThemeData(
                scaffoldBackgroundColor: const Color(0xFFF6F6F6),
              ),
              home: Wrapper(), // aka '/'
              routes: <String, WidgetBuilder>{
                '/reg': (BuildContext context) => new Registration(),
                '/sb': (BuildContext context) => new Slotbooking(),
              },
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                ),
                Text(
                  "Loading...",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/*class OTPPage extends StatefulWidget {
  final String title;
  OTPPage({Key key, this.title}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final validateButton = Container(
        width: 200,
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff138808),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            //onPressed: () {}, // here we need to add the functionality
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OTPPage()),
              );
            },
            child: Text("Verify",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ));
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("OTP Page"),
      ),*/
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                  //width: 800,
                  children: <Widget>[
                    SizedBox(height: 180.0),
                    TextField(
                      obscureText: true,
                      style: style,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "Enter OTP",
                          //hintText: "OTP",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                    ),
                    SizedBox(height: 25.0),
                    validateButton
                  ]),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

// home Page
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = Container(
        width: 800,
        child: TextField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: "Mobile No/Email",
              //hintText: "Mobile No/Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
        ));

    final passwordField = Container(
        width: 800,
        child: TextField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "OTP",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
        ));
    final nextButton = Container(
        width: 200,
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff138808),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            //onPressed: () {}, // here we need to add the functionality
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OTPPage()),
              );
            },
            child: Text("Next",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ));

    return Scaffold(
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 150.0,
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        emailField,
                        SizedBox(height: 25.0),
                        nextButton,
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
