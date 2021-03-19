import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_safe/screens/ui/error.dart';
import 'package:travel_safe/screens/ui/loading.dart';

class GetDriver extends StatelessWidget {
  final String documentId;

  GetDriver(this.documentId);
  @override
  Widget build(BuildContext context) {
    CollectionReference drivers =
        FirebaseFirestore.instance.collection('drivers');
    return FutureBuilder<DocumentSnapshot>(
      future: drivers.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return data == null
              ? Text("Not found")
              : Text("Full Name: ${data['name']}");
        }
        return Loading();
      },
    );
  }
}
