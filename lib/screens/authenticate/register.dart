import 'package:flutter/material.dart';
import '../../services/AuthService.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

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
              label: Text('Sign In'))
        ],
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register for Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Flexible(
                child: TextFormField(
                  validator: (value) => value.isEmpty ? 'Enter an Email' : null,
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
                  validator: (value) => value.length < 6
                      ? 'Enter a password 6+ chars long'
                      : null,
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
                  //SING INTO FIREBASE with username and password
                  if (_formkey.currentState.validate()) {
                    dynamic result =
                        await _auth.registerWithEmailAndPasswd(email, password);
                    if (result == null) {
                      setState(() => error = 'please supply valiate email');
                    } else {
                      print(email);
                      print(password);
                      print(error);
                    }
                  }
                },
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                  child: Text('Sign in Anon'),
                  onPressed: () async {
                    dynamic result = _auth.signinAnon();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
