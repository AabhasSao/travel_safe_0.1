import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _name;
  String _contactNo;
  String _email;
  String _address;
  String _aadhar;
  String _password;
  String _emergencyContactNo;

  final _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Full Name *',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
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

  Widget _buildAadhar() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Aadhar No *',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please aadhar no';
        }
        return null;
      },
      onSaved: (String value) {
        _aadhar = value;
      },
    );
  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  Widget _buildContactNo() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Contact no. *',
      ),
      validator: (value) {
        return validateMobile(value);
      },
      onSaved: (String value) {
        _contactNo = value;
      },
    );
  }

  Widget _buildEmergencyContactNo() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Emergency Contact no.  *',
      ),
      validator: (value) {
        return validateMobile(value);
      },
      onSaved: (String value) {
        _emergencyContactNo = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Address *',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your address.';
        }
        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildName(),
            _buildEmail(),
            _buildPassword(),
            _buildAadhar(),
            _buildAddress(),
            _buildContactNo(),
            _buildEmergencyContactNo(),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if (!_formKey.currentState.validate()) {
                  return;
                }

                _formKey.currentState.save();
              },
            )
          ],
        ));
  }
}
