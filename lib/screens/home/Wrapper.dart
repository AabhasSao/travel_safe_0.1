import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_safe/screens/home.dart';
import 'package:travel_safe/screens/sign_in.dart';
import 'package:travel_safe/screens/ui/error.dart';
import 'package:travel_safe/screens/ui/loading.dart';

import '../../GoogleSignInProvider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);
              if (provider.isSigningIn) {
                return Loading();
              } else if (snapshot.hasData) {
                return Home();
              } else {
                return SignIn();
              }
            },
          ),
        ),
      ),
    );
  }
}
