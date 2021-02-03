import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:covid_vaccine/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:covid_vaccine/screens/authenticate/authenticate.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RegistrationPage(
        title: "registration page",
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // int _counter = 0;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static const IconData camera = IconData(0xe62e, fontFamily: 'MaterialIcons');
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  /*void nextPage() {
    setState(() {
      _counter++;
      print(_counter);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    final nameField = Container(
        width: 800,
        child: TextField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: "Name",
              //hintText: "Mobile No/Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ));

    final dobField = Container(
        width: 800,
        child: TextField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: "Date of Birth",
              //hintText: "Mobile No/Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ));

    final aadhaarField = Container(
        width: 800,
        child: TextField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: "Aadhar Number",
              //hintText: "Mobile No/Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ));

    final cancelButton = Container(
        child: Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red[900],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        //onPressed: () {}, // here we need to add the functionality
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Cancel",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    ));

    final nextButton = Container(
        child: Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green[700],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        //onPressed: () {}, // here we need to add the functionality
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Next",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   tooltip: 'Navigation menu',
        //   onPressed: null,
        // ),

        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),

        title: Text('Beneficiary Information Entry',
            style: style.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              //fontSize: 40.0,
            )),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.refresh),
        //     tooltip: 'Refresh',
        //     onPressed: null,
        //   ),
        // ],
      ),
      // body is the majority of the screen.
      body: Scrollbar(
        child: SingleChildScrollView(
          /*child: Padding(
            padding: const EdgeInsets.all(1.0),*/
          child: Center(
              /*width: 300,
              padding: const EdgeInsets.all(36.0),*/
              child: Container(
                  width: 365,
                  child: Column(
                      /*verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.center,*/
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        // CircularProfileAvatar(
                        //   '"assets/profile.png"',
                        //   borderColor: Colors.black12,
                        //   backgroundColor: Colors.transparent,
                        //   borderWidth: 1,
                        //   elevation: 2,
                        //   radius: 50,
                        // ),
                        SizedBox(
                          height: 150.0,
                          child: Image.asset(
                            "assets/profile.png",
                            fit: BoxFit.contain,
                            color: Colors.blue[600],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // TODO: implement the redirect to camera app button
                        // Icon(Icons.camera, size: 40.0),
                        SizedBox(
                          height: 25.0,
                          child: Image.asset(
                            "assets/camera.png",
                            fit: BoxFit.contain,
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        nameField,
                        SizedBox(
                          height: 40,
                        ),
                        dobField,
                        SizedBox(
                          height: 40,
                        ),
                        aadhaarField,
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Row(
                            children: [
                              new Flexible(
                                child: Container(
                                    child: cancelButton,
                                    alignment: Alignment.centerLeft),
                                flex: 2,
                              ),
                              new Flexible(
                                child: Container(
                                  alignment: Alignment.center,
                                ),
                                flex: 1,
                              ),
                              new Flexible(
                                child: Container(
                                    child: nextButton,
                                    alignment: Alignment.centerRight),
                                flex: 2,
                              )
                              //Spacer(),
                              // nextButton,
                              // Spacer(
                              //   flex: 1,
                              // ),
                              // cancelButton,
                              // Spacer(),
                            ],
                          ),
                        ),
                      ]))),
        ),
      ),
    );
  }
}