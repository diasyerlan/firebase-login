import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserData extends StatelessWidget {
  final String documentID;
  const GetUserData({super.key, required this.documentID});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder(
        future: users.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(data['first name'] +
                ' ' +
                data['last name'] +
                ', ' +
                data['age'].toString() +
                ' years old');
          }
          return Text('Loading...');
        }));
  }
}
