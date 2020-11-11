import 'package:brew_crew/models/thisuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a custom ThisUser object (UID only), based on the firebase [User user] (lots of misc data) object / class
  ThisUser _userFromFirebaseUser(User user) {
    return user != null ? ThisUser(uid: user.uid) : null;
  }

  //auth change in User stream, passed to map of our custom type
  Stream<ThisUser> get user {
    return _auth
        .authStateChanges()
        // .map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign in anon method
  Future signinAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      //User is a firebase class for user.
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in user & passwd

  //register new account with username & passwd
  Future registerWithEmailAndPasswd(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out of account
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('signout error');
      print(e.toString());
      return null;
    }
  }
}
