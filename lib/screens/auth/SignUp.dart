import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_safe/components/inputFieldForm.dart';
import 'package:travel_safe/models/AddUser.dart';
import 'package:travel_safe/models/AppUser.dart';
import 'package:travel_safe/services/authentication/auth.dart';

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
  String _emergencyContactRelation;

  final _formKey = GlobalKey<FormState>();

  AuthService _auth = AuthService();

  Widget _buildName() {
    return MyInputFieldForm().textField(
      label: 'Full Name *',
      validatorCallback: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      locationCallback: (String value) {
        _name = value;
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

  Widget _buildAadhar() {
    return MyInputFieldForm().textField(
      label: 'Aadhar No *',
      validatorCallback: (value) {
        if (value.isEmpty) {
          return 'Please aadhar no';
        }
        return null;
      },
      locationCallback: (String value) {
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
    return MyInputFieldForm().textField(
      label: 'Contact no. *',
      validatorCallback: (value) {
        return validateMobile(value);
      },
      locationCallback: (String value) {
        _contactNo = value;
      },
    );
  }

  Widget _buildEmergencyContactNo() {
    return MyInputFieldForm().textField(
      label: 'Emergency Contact no.  *',
      validatorCallback: (value) {
        return validateMobile(value);
      },
      locationCallback: (String value) {
        _emergencyContactNo = value;
      },
    );
  }

  Widget _buildAddress() {
    return MyInputFieldForm().textField(
      label: 'Address *',
      validatorCallback: (value) {
        if (value.isEmpty) {
          return 'Please enter your address.';
        }
        return null;
      },
      locationCallback: (String value) {
        _address = value;
      },
    );
  }

  Widget _buildEmergencyContactRelation() {
    return MyInputFieldForm().textField(
      label: 'Emergency Contact Relation *',
      validatorCallback: (value) {
        if (value.isEmpty) {
          return 'Please enter some text.';
        }
        return null;
      },
      locationCallback: (String value) {
        _emergencyContactRelation = value;
      },
    );
  }

  void _sendToFirestoreUsers() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    // register user with email and password
    final AppUser user = await _auth.register(_email, _password);
    if (user == null) {
      return null;
    }
    final String _uid = user.uid;

    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users
        .doc(_uid)
        .set({
          'fullName': _name,
          'aadharNo': _aadhar,
          'address': _address,
          'email': _email,
          'contactNo': _contactNo,
          'emergencyContactNo': _emergencyContactNo,
          'uid': _uid,
          'emergencyContactRelation': _emergencyContactRelation,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void showAlreadyExistsToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('User with this email already exists.'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueAccent.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildName(),
              SizedBox(height: 20),
              _buildEmail(),
              SizedBox(height: 20),
              _buildPassword(),
              SizedBox(height: 20),
              _buildAadhar(),
              SizedBox(height: 20),
              _buildAddress(),
              SizedBox(height: 20),
              _buildContactNo(),
              SizedBox(height: 20),
              _buildEmergencyContactNo(),
              SizedBox(height: 20),
              _buildEmergencyContactRelation(),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () {
                  _sendToFirestoreUsers();
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Log in to an existing account'),
              ),
            ],
          )),
    );
  }
}
