import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_safe/models/AppUser.dart';
import 'package:travel_safe/services/authentication/auth.dart';

class SignInProvider extends ChangeNotifier {
  bool _isSigningIn;
  AuthService _auth = AuthService();

  SignInProvider() {
    _isSigningIn = false;
  }
  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future login(String email, String password) async {
    final String _email = email;
    final String _password = password;

    isSigningIn = true;
    final AppUser user = await _auth.sigInWithEmailPassword(_email, _password);
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      isSigningIn = false;
    }
  }

  void logout() async {
    FirebaseAuth.instance.signOut();
  }
}
