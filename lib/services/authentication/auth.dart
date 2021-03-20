import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_safe/models/AppUser.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser _appUserFromFirebaseUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // signin with email
  Future<AppUser> sigInWithEmailPassword(String email, String password) async {
    final String _email = email;
    final String _password = password;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      User user = userCredential.user;
      return _appUserFromFirebaseUser(user);
      print("signed in with email and password successful");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  // Register with email and password
  Future<AppUser> register(String email, String password) async {
    final String _email = email;
    final String _password = password;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      User user = userCredential.user;
      print(user.uid);
      return _appUserFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Sign in with google
  Future signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCred = await _auth.signInWithCredential(credential);
      User user = userCred.user;
      print('success' + _appUserFromFirebaseUser(user).uid);
      return _appUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
