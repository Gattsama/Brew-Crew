import 'package:flutter/material.dart';
import '../../services/AuthService.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //to use later for textform valigate
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign into Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Flexible(
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(hintText: 'Enter Email Address'),
                ),
              ),
              SizedBox(height: 20.0),
              Flexible(
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Enter Password'),
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () async {
                  //SING INTO FIREBASE
                  print(email);
                  print(password);
                },
                color: Colors.pink[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// SAVED FOR POSSIBLE FUTURE USE, ANON SIGN InheritedNotifier
//
// RaisedButton(
// child: Text('Sign in Anon'),
// onPressed: () async {
// dynamic result = await _auth
//     .signinAnon(); //just sets AuthService.dart's return _userFromFirebaseUser to == result
// if (result == null) {
// print('it is null');
// } else {
// print(result.uid);
// print('we signed in !!!');
// }
// },
// ),
