import 'package:covid_vaccine/screens/authenticate/signin.dart';
import 'package:covid_vaccine/screens/registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
      print(showSignIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? SignInWithEmail(toggleView: toggleView)
        : CreateAccWithEmail(toggleView: toggleView);
  }
}

class OTPPage extends StatefulWidget {
  final String title;
  OTPPage({Key key, this.title}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _currentPin = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _verifyButtonKey = GlobalKey();
  int _colorListIndex = 0;
  List<Color> _verifyButtonColor = <Color>[
    Color.fromRGBO(0, 200, 130,
        1.0), //(0xFF00B464), // RGB code tweaked from (0, 226, 152, 1.0)
    Colors.cyan[400],
    Color(0xFF29B6F6),
  ];

  void setColor(int c) {
    setState(() {
      _colorListIndex = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    final otpField = OTPTextField(
      onChanged: (pin) async {
        _currentPin = pin;
        print("Current PIN: " + pin);
      },
      obscureText: true,
      length: 4,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 40,
      style: TextStyle(
        fontSize: 30,
      ),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        _currentPin = pin;
        print("Completed: " + _currentPin);
      },
    );

    final verifyButton = Container(
      width: 200,
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xFF29B6F6), //Colors.cyan[400],

        child: MaterialButton(
          key: _verifyButtonKey,
          minWidth: MediaQuery.of(context).size.width,
          height: 50,
          //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () async {
            setColor((_colorListIndex + 1) % _verifyButtonColor.length);
            print("_colorListIndex = $_colorListIndex");
            print("Submitted PIN: $_currentPin");
            Navigator.of(context).popUntil(ModalRoute.withName('/'));
          },
          child: Container(
            child: Text(
              "Verify",
              textAlign: TextAlign.center,
              style: style.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

    final resendButton = TextButton(
      onPressed: () async {
        print("Resend OTP");
      },
      child: Text(
        "Resend OTP",
        style: TextStyle(
          color: Colors.lightBlueAccent,
        ),
      ),
    );
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
      backgroundColor: Colors.white,
      /*appBar: PreferredSize(
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
          title: Text(
            'OTP Verification',
            style: style.copyWith(
              color: Colors.blue,
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
      ),*/
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Enter the OTP",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  otpField,
                  SizedBox(height: 60.0),
                  verifyButton,
                  SizedBox(height: 10.0),
                  resendButton,
                ],
              ),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
