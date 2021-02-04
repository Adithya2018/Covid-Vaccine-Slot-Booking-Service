import 'package:firebase_auth/firebase_auth.dart';

/*
* sign-in and sign-out service
**/
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // anonymous sign-in
  Future signInAnon() async {
    User user;
    try {
      UserCredential result = await _auth.signInAnonymously();
      user = result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
    return user;
  }

  // email and password sign-in

  // register with email and password

  // sign out

}
