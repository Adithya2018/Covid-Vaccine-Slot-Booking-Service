import 'dart:io';

import 'package:covid_vaccine/models/user.dart';
import 'package:covid_vaccine/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authenticate.dart';

/*class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}*/

class SignInOptions extends StatefulWidget {
  @override
  _SignInOptionsState createState() => _SignInOptionsState();
}

class _SignInOptionsState extends State<SignInOptions> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final signInAnonButton = Container(
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.green[700],
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          //onPressed: () {}, // here we need to add the functionality
          onPressed: () async {
            UserData userX = await _auth.signInAnon();
            print(userX == null
                ? 'sign in was not successful'
                : 'signed in anonymously: $userX.uid');
            Navigator.of(context).popUntil((route) => false);
            Navigator.of(context).pushNamed('/');
          },
          child: Text(
            "Anonymous",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

    final signOutAnonButton = Container(
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.green[700],
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          // here we need to add the functionality
          onPressed: () async {
            print("signing out");
            UserData userX = await _auth.signOut();
            print("$userX signed out");
            Navigator.of(context).popUntil((route) => false);
            Navigator.of(context).pushNamed('/');
          },
          child: Text(
            "Sign out",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

    //sign-in with email/mobile no. button
    final signInOthButton = Container(
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.red[900],
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          //onPressed: () {}, // here we need to add the functionality
          onPressed: null,
          child: Text(
            "email/mobile no.",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('sign in options')),
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
                            // "assets/logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        signInAnonButton,
                        SizedBox(height: 25.0),
                        signOutAnonButton
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
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginPage(
        title: "Login page",
      ),
    );
  }
}

class SignInWithEmail extends StatefulWidget {
  final Function toggleView;
  SignInWithEmail({this.toggleView});
  @override
  _SignInWithEmailState createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController c1 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();

  FocusNode _n1;
  FocusNode _n2;
  FocusNode _n3;

  @override
  void initState() {
    super.initState();
    c1.addListener(() => null);
    c2.addListener(() => null);
    _n1 = FocusNode();
    _n2 = FocusNode();
    _n3 = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _n1.dispose();
    _n2.dispose();
    _n3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailPhNoField = Container(
      width: 600,
      child: TextField(
        focusNode: _n1,
        textInputAction: TextInputAction.next,
        onSubmitted: (term) {
          _n1.unfocus();
          FocusScope.of(context).requestFocus(_n2);
        },
        onChanged: null,
        controller: c1,
        style: style,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Email",
          //hintText: "Email/Phone No.",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );

    final pwdField = Container(
      width: 600,
      child: TextField(
        focusNode: _n2,
        textInputAction: TextInputAction.next,
        onSubmitted: (term) {
          _n2.unfocus();
          FocusScope.of(context).requestFocus(_n3);
        },
        onChanged: null,
        obscureText: true,
        style: style,
        controller: c2,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Password",
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );

    final signInButton = Container(
      width: 200,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        //color: Colors.blue,
        color: Colors.cyan[300],
        child: MaterialButton(
          focusNode: _n3,
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {
            print("Email: ${c1.text}");
            print("Password: ${c2.text}");
          },
          child: Text(
            "Sign in",
            textAlign: TextAlign.center,
            style: style.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 3.0,
          backgroundColor: Colors.cyan[300],
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.blue,
              size: 30.0,
            ),
            tooltip: 'Navigation menu',
            onPressed: () => print("Nav menu"),
          ),
          title: Text(
            'Sign In', // Page',
            style: style.copyWith(
              color: Colors.grey[100],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person_add_alt_1,
                color: Colors.blue,
                size: 30.0,
              ),
              tooltip: 'Register',
              onPressed: () {
                print('Create an account w/ Email');
                widget.toggleView();
              },
            ),
          ],
        ),
      ),
      body: /**/ Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 35.0, 30.0, 30.0),
                child: Container(
                  width: 600,
                  //width: 330,
                  child: Column(
                    /*verticalDirection: VerticalDirection.down,
                    crossAxisAlignment: CrossAxisAlignment.center,*/
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 500,
                        ),
                        child: AspectRatio(
                          aspectRatio: 55 / 32,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage('assets/app_logo.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*SizedBox(
                        height: 160.0,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),*/
                      SizedBox(
                        height: 40,
                      ),
                      emailPhNoField,
                      SizedBox(
                        height: 40,
                      ),
                      pwdField,
                      SizedBox(
                        height: 40,
                      ),
                      signInButton,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

    /*final passwordField = Container(
        width: 800,
        child: TextField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "OTP",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
        ));*/
    final nextButton = Container(
        width: 200,
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.blue,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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

    final signInAnonButton = Container(
        width: 200,
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.blue,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 5.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.blue,
              size: 30.0,
            ),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          title: Text('Welcome',
              style: style.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.blue,
                size: 30.0,
              ),
              tooltip: 'Refresh',
              onPressed: null,
            ),
          ],
        ),
      ),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 150.0,
                          child: Image.asset(
                            // "assets/logo.png",
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
                        signInAnonButton,
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
}
