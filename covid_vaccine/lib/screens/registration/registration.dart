import 'package:covid_vaccine/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  // static const IconData camera = IconData(0xe62e, fontFamily: 'MaterialIcons');
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

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
  final Function toggleView;
  CreateAccWithEmail({this.toggleView});
  @override
  _CreateAccWithEmailState createState() => _CreateAccWithEmailState();
}

class _CreateAccWithEmailState extends State<CreateAccWithEmail> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final AuthService _auth = AuthService();
  //String error = "";
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _pwd = "";
  TextEditingController _pwdFieldController = new TextEditingController();
  String _confPwd = "";

  FocusNode _n1;
  FocusNode _n2;
  FocusNode _n3;

  @override
  void initState() {
    super.initState();
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
    final emailField = Container(
      width: 600,
      child: TextFormField(
        focusNode: _n1,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (term) {
          _n1.unfocus();
          FocusScope.of(context).requestFocus(_n2);
        },
        style: style,
        onChanged: (val) {
          setState(() {
            _email = val;
          });
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        validator: (val) {
          String s;
          if (val.isEmpty) {
            s = "Email cannot be empty";
          }
          return s;
        },
      ),
    );

    final pwdField = Container(
      width: 600,
      child: TextFormField(
        controller: _pwdFieldController,
        focusNode: _n2,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (term) {
          _n2.unfocus();
          FocusScope.of(context).requestFocus(_n3);
        },
        obscureText: true,
        style: style,
        onChanged: (val) {
          setState(() {
            _pwd = val;
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
        validator: (val) {
          String s;
          if (val.isEmpty) {
            s = "Password cannot be empty";
          } else if (val.length < 8) {
            s = "Password must be at least 8 characters long";
          }
          return s;
        },
      ),
    );

    final confPwdField = Container(
      width: 600,
      child: TextFormField(
        focusNode: _n3,
        obscureText: true,
        style: style,
        onFieldSubmitted: (val) {},
        onChanged: (val) {
          setState(() {
            _confPwd = val;
          });
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Re-type password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        validator: (val) {
          String s;
          if (val.isEmpty) {
            s = "Password cannot be empty";
          } else if (val.length < 8) {
            s = "Password must be at least 8 characters long";
          } else if (_pwd != _confPwd) {
            s = "Passwords do not match";
          }
          return s;
        },
      ),
    );

    Future<void> _invalidOrAccExists() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Text("Error "),
                Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
              ],
            ),
            content: Container(
              child: Text(
                "Used or invalid e-mail address",
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Continue"),
              ),
            ],
          );
        },
      );
    }

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
            print("Email: $_email");
            print("Password: $_pwd");
            print("Re-typed password: $_confPwd");
            if (_formKey.currentState.validate()) {
              dynamic result = await _auth.reqNewAccountWithEmail(
                _email,
                _pwd,
              );
              if (result == null) {
                await _invalidOrAccExists();
              } else {
                Navigator.of(context).popUntil((route) => false);
                Navigator.of(context).pushNamed('/');
              }
            }
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
                Icons.login,
                color: Colors.blue,
                size: 30.0,
              ),
              tooltip: 'Sign-in options',
              onPressed: () {
                print("Sign In w/ Email");
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
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 500,
                        ),
                        child: AspectRatio(
                          aspectRatio: 55 / 32,
                          child: Container(
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage('assets/app_logo.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*Container(
                        width: 260,
                        height: 260,
                        child: SizedBox(
                          height: 360.0,
                          child: Image.asset(
                            "assets/app_logo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),*/
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            emailField,
                            SizedBox(
                              height: 40,
                            ),
                            pwdField,
                            SizedBox(
                              height: 40,
                            ),
                            confPwdField,
                          ],
                        ),
                      ),
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

class ConfirmEmail extends StatefulWidget {
  @override
  _ConfirmEmailState createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  TextStyle buttonStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Widget centerWidget = Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Attention ",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.warning,
            color: Colors.yellow[800],
            size: 30,
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "We have sent an email to your email address. Please read the email for further instructions.",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      )
    ],
  );
  void switchWidget() {
    setState(
      () {
        centerWidget = Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Verified ",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Tap to continue",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            'Create account',
            style: TextStyle(
              color: Colors.grey[100],
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              fontSize: 23.0,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.navigate_next,
                color: Colors.blue,
                size: 30.0,
              ),
              tooltip: 'continue',
              onPressed: () {
                switchWidget();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
                child: Container(
                  width: 600,
                  child: centerWidget,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
