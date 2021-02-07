//import 'dart:js';

import 'package:covid_vaccine/models/user.dart';
import 'package:covid_vaccine/screens/authenticate/authenticate.dart';
import 'package:covid_vaccine/screens/authenticate/signin.dart';
import 'package:covid_vaccine/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    // return home or authenticate widget depending on the authentication state
    // i.e. whether the user has signed in or signed out
    print(user);
    return SignInOptions();
  }
}
