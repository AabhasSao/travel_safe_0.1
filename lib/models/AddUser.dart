import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String fullName;
  final String aadharNo;
  final String email;
  final String address;
  final String contactNo;
  final String emergencyContactNo;
  final String uid;

  AddUser(
      {this.fullName,
      this.aadharNo,
      this.address,
      this.uid,
      this.contactNo,
      this.email,
      this.emergencyContactNo});

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'fullName': fullName,
            'aadharNo': aadharNo,
            'address': address,
            'email': email,
            'contactNo': contactNo,
            'emergencyContactNo': emergencyContactNo,
            'uid': uid,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}
