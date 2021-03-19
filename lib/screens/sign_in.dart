import 'package:flutter/material.dart';
import 'package:travel_safe/services/authentication/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: RaisedButton(
          child: Text('sign in with google'),
          onPressed: () async {
            dynamic res = await _auth.signInWithGoogle();
            if (res == null) {
              print('sigin failed');
            } else {
              print('sucess ' + res.user.uid);
              return res;
            }
          },
        ),
      ),
    );
  }
}
