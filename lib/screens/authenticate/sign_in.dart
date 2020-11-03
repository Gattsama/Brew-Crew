import 'package:flutter/material.dart';
import '../../services/AuthService.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign into Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
          child: Text('Sign in Anon'),
          onPressed: () async {
            dynamic result = await _auth
                .signinAnon(); //just sets AuthService.dart's return _userFromFirebaseUser to == result
            if (result == null) {
              print('it is null');
            } else {
              print(result.uid);
              print('we signed in !!!');
            }
          },
        ),
      ),
    );
  }
}
