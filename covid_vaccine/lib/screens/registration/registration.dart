//import 'dart:html';
import 'package:xml/xml.dart';
import 'dart:io' show Platform;
import 'dart:math';
import 'package:covid_vaccine/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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

class QRCodeScanResult extends StatefulWidget {
  @override
  _QRCodeScanResultState createState() => _QRCodeScanResultState();
}

class _QRCodeScanResultState extends State<QRCodeScanResult> {
  //String result = "";
  String scanData = "Tap anywhere to Scan QR Code";
  void toggleView(String result) {
    setState(() {
      scanData = result;
      //this.result = result;
    });
    print("${result.runtimeType}");
    Navigator.of(context).pop();
  }

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
            'Applicant ID',
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
                print("continue");
              },
            ),
          ],
        ),
      ),
      body: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Color.fromRGBO(0, 0, 0, 0.025),
        height: 30,
        onPressed: () {
          print("tap");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QRCodeScanner(
                toggleView: toggleView,
              ),
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /**/ Icon(
                Icons.qr_code_sharp,
                size: 75,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                scanData,
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
    );
  }
}

class QRCodeScanner extends StatefulWidget {
  final Function toggleView;
  QRCodeScanner({this.toggleView});

  @override
  State<StatefulWidget> createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool cameraActive = true;
  bool flashOn = false;

  void toggleCameraState() {
    setState(
      () {
        cameraActive = !cameraActive;
      },
    );
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    print("Closing the scanner...");
    super.deactivate();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<bool> isFlashOn() async {
    return await controller
        ?.getFlashStatus(); //getFlashStatus()?.then((val) => flashOn = val)?.onError((error, stackTrace) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: _buildQrView(context),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: [
                            IconButton(
                              iconSize: 45,
                              highlightColor: Colors.transparent,
                              splashColor: flashOn
                                  ? Colors.transparent
                                  : Colors.yellow[200], //Color(0xFFFFF176),
                              splashRadius: MediaQuery.of(context).size.width,
                              onPressed: () async {
                                await controller?.toggleFlash()?.whenComplete(
                                  () {
                                    setState(() {
                                      flashOn = !flashOn;
                                    });
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.flash_on,
                                color:
                                    flashOn ? Colors.yellow[200] : Colors.black,
                              ),
                            ),
                            FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    '${snapshot.data ? "ON" : "OFF"}',
                                  );
                                }
                                return Text('N/A');
                              },
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        iconSize: 75,
                        onPressed: () async {
                          if (cameraActive) {
                            await controller?.pauseCamera()?.whenComplete(() {
                              setState(() {
                                cameraActive = false;
                              });
                            });
                          } else {
                            await controller?.resumeCamera()?.whenComplete(
                              () {
                                setState(() {
                                  cameraActive = true;
                                });
                              },
                            );
                          }
                        },
                        icon: cameraActive
                            ? Icon(Icons.pause_circle_outline)
                            : Icon(
                                Icons.play_circle_outline,
                                color: Colors.green[600],
                              ),
                      ),
                      IconButton(
                        iconSize: 45,
                        color: Colors.red[600],
                        onPressed: () async {
                          await controller?.stopCamera()?.whenComplete(
                            () {
                              print("Stopped camera...");
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        icon: Icon(Icons.stop_circle_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    Size s = MediaQuery.of(context).size;
    var scanArea = (s.width < 400 || s.height < 400) ? 170.0 : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.greenAccent[400],
        borderRadius: 7,
        borderLength: 40,
        borderWidth: 7,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      this.controller?.resumeCamera()?.whenComplete(() {
        cameraActive = true;
      })?.catchError((e) {
        cameraActive = true;
        print(e.toString());
      });
      this.controller?.getFlashStatus()?.then((val) {
        flashOn = val;
      })?.catchError((e) {
        flashOn = false;
        print(e.toString());
      });
    });
    controller.scannedDataStream.listen((scanResult) {
      try {
        final document = XmlDocument.parse(scanResult.code);
        print("${document.toString()} sdvndn");
        final titles = document.rootElement.attributes;
        String result = "";
        for(XmlAttribute t in titles){
          result += "${t.name.toString()}: ${t.value}\n";
        }
        controller?.stopCamera()?.whenComplete(() {
          widget.toggleView(result);
        })?.catchError((e) => print(e.toString()));
      } on XmlParserException catch (e) {
        print("${e.toString()} nvdsk");
        print(e.message);
      }
    });
  }
}
