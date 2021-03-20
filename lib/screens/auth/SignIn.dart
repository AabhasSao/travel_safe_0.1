import 'package:flutter/material.dart';
import 'package:travel_safe/components/inputField.dart';
import 'package:travel_safe/components/inputFieldForm.dart';
import 'package:travel_safe/models/AppUser.dart';
import 'package:travel_safe/screens/auth/SignUp.dart';
import 'package:travel_safe/screens/basic_layout.dart';
import 'package:travel_safe/screens/qr_scanner.dart';
import 'package:travel_safe/services/authentication/auth.dart';

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
    return MyInputFieldForm().textField(
      label: 'Password *',
      hide: true,
      validatorCallback: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      locationCallback: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildEmail() {
    return MyInputFieldForm().textField(
      label: 'Email *',
      validatorCallback: (value) {
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
      locationCallback: (String value) {
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
            SizedBox(height: 40),
            Container(
              child: Center(
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueAccent.withOpacity(0.8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            _buildEmail(),
            SizedBox(height: 20),
            _buildPassword(),
            SizedBox(height: 20),
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
                    MaterialPageRoute(builder: (context) => QrScanner()),
                  );
                }
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BasicLayout(
                            widgt: SignUp(),
                            fullWidth: false,
                          )),
                );
              },
              child: Text('Create An Account'),
            )
          ],
        ));
  }
}
