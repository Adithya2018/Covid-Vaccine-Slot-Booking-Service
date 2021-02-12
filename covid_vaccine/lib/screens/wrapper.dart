//import 'dart:js';

import 'package:covid_vaccine/models/user.dart';
import 'package:covid_vaccine/screens/authenticate/authenticate.dart';
import 'package:covid_vaccine/screens/authenticate/signin.dart';
import 'package:covid_vaccine/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'authenticate/forgotpwd.dart';

// this is the root ('/') widget
class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    // return home or authenticate widget depending on the authentication state
    // i.e. whether the user has signed in (=not null) or signed out (=null)

    /**/if(user != null){
      print("$user is signed in");
      return Home();
    }else {
      print("$user was signed out");
      return SignInOptions();
    } //Authenticate();
  }
}
