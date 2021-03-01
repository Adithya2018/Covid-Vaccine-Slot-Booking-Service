import 'package:covid_vaccine/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OTPPage(
        title: "OTP Page",
      ),
    );
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
        print("Completed: " + pin);
      },
    );

    final validateButton = Container(
      width: 200,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.cyan[400], //Color(0xff138808),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          height: 50,
          //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () async {
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
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
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
                  /*TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: "Enter OTP",
                      //hintText: "OTP",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),*/
                  SizedBox(height: 60.0),
                  validateButton,
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
