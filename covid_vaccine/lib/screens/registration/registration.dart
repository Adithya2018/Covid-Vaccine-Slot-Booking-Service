//import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:covid_vaccine/screens/home/home.dart';
import 'package:covid_vaccine/screens/registration/slotbooking.dart';
import 'package:flutter/material.dart';
import 'package:covid_vaccine/screens/authenticate/authenticate.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RegistrationPage(
      title: "registration page",
    );
    /*Container(
      child: RegistrationPage(
        title: "registration page",
      ),
    );*/
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
    final nameField = Container(
      width: 600, //800,
      child: TextField(
        obscureText: false,
        style: style,
        decoration: InputDecoration(
          hoverColor: Colors.teal,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Name",
          //hintText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );

    final dobField = Container(
      width: 600, //800,
      child: TextField(
        obscureText: false,
        style: style,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Date of Birth",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );

    // TODO: Aadhaar no. verification after entering it
    final aadhaarField = Container(
      width: 600, //800,
      child: TextField(
        obscureText: false,
        style: style,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Aadhar Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );

    final cancelButton = Container(
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.red[600],
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Cancel",
            textAlign: TextAlign.center,
            style: style.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    final nextButton = Container(
      //width: 20.0,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.green[600],
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/sb',
            );
          },
          child: Text(
            "Next",
            textAlign: TextAlign.center,
            style: style.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    final _buttonList = Container(
      width: 600,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: cancelButton,
          ),
          Spacer(),
          Expanded(
            flex: 2,
            child: nextButton,
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 3.0,
          backgroundColor: Colors.cyan[300],
          title: Text(
            'Registration', // Page',
            style: style.copyWith(
              color: Colors.grey[100],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          actions: <Widget>[
            /*IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 30.0,
              ),
              tooltip: 'Refresh',
              onPressed: null,
            ),*/
          ],
        ),
      ),
      // body is the majority of the screen.
      body: Scrollbar(
        child: SingleChildScrollView(
          /*child: Padding(
            padding: const EdgeInsets.all(1.0),*/
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 30.0),
              child: Container(
                width: 600,
                child: Column(
                  /*verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.center,*/
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      child: CircleAvatar(
                        child: Image(
                          image: AssetImage('assets/profile.png'),
                        ),
                        radius: 50,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // TODO: implement the redirect to camera app button
                    IconButton(
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.camera_alt_rounded,
                      ),
                      onPressed: () {},
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
                    _buttonList,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateAccWithEmail extends StatefulWidget {
  @override
  _CreateAccWithEmailState createState() => _CreateAccWithEmailState();
}

class _CreateAccWithEmailState extends State<CreateAccWithEmail> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String email = "";
  String pwd = "";
  String confPwd = "";

  FocusNode n1;
  FocusNode n2;
  FocusNode n3;

  @override
  void initState() {
    super.initState();
    n1 = FocusNode();
    n2 = FocusNode();
    n3 = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    n1.dispose();
    n2.dispose();
    n3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = Container(
      width: 500,
      child: TextField(
        focusNode: n1,
        textInputAction: TextInputAction.next,
        onSubmitted: (term) {
          n1.unfocus();
          FocusScope.of(context).requestFocus(n2);
        },
        style: style,
        onChanged: (val) {
          setState(() {
            email = val;
          });
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );

    final pwdField = Container(
      width: 500,
      child: TextField(
        focusNode: n2,
        textInputAction: TextInputAction.next,
        onSubmitted: (term) {
          n2.unfocus();
          FocusScope.of(context).requestFocus(n3);
        },
        obscureText: true,
        style: style,
        onChanged: (val) {
          setState(() {
            pwd = val;
          });
        },
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

    final confPwdField = Container(
      width: 500,
      child: TextField(
        focusNode: n3,
        obscureText: true,
        style: style,
        onChanged: (val) {
          setState(() {
            confPwd = val;
          });
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Re-type password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );

    final submitButton = Container(
      width: 200,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.cyan[300],
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () async {
            print("Email: $email");
            print("Password: $pwd");
            print("Re-typed password: $confPwd");
            Navigator.of(context).pushNamed('/reg');
          },
          child: Text(
            "Next",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
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
            'Create account', // Page',
            style: style.copyWith(
              color: Colors.grey[100],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 160.0,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      emailField,
                      SizedBox(
                        height: 40,
                      ),
                      pwdField,
                      SizedBox(
                        height: 40,
                      ),
                      confPwdField,
                      SizedBox(
                        height: 40,
                      ),
                      submitButton,
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
