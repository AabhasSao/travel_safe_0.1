import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(data['profileImage']),
                    ),
                    SizedBox(height: 20),
                    Text(
                      data['fullName'],
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.blue,
                            ),
                            title: Text(
                              data['contactNo'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          )),
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            leading: Icon(
                              Icons.local_taxi,
                              color: Colors.blueAccent,
                            ),
                            title: Text(
                              data['vehicleId'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          )),
                    ),
                  ],
                );

          // Text("Full Name: ${data['name']}");
        }
        return Loading();
      },
    );
  }
}
