import 'package:flutter/material.dart';
import 'package:travel_safe/models/AppUser.dart';
import 'package:travel_safe/services/authentication/auth.dart';

import '../home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email;
  String _password;

  AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password *',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email *',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'Please enter a valid email address.';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildEmail(),
            _buildPassword(),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () async {
                if (!_formKey.currentState.validate()) {
                  return;
                }
                _formKey.currentState.save();

                AppUser user =
                    await _auth.sigInWithEmailPassword(_email, _password);
                if (user == null) {
                  return;
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }
              },
            )
          ],
        ));
  }
}
