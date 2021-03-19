import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_safe/models/AppUser.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser _appUserFromFirebaseUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // user stream

  User _fromUserCredToUser(UserCredential userCred) {
    return userCred != null ? userCred.user : null;
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
