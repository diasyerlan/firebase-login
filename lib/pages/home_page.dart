import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/get%20data/get_user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> userIDs = [];

  Future getUserIds() async {
    await FirebaseFirestore.instance
        .collection('users')
        .orderBy('age', descending: true)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              userIDs.add(document.reference.id);
            }));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email!),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              child: Icon(Icons.logout),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getUserIds(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: userIDs.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.amber[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              title: GetUserData(documentID: userIDs[index]),
                            ),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
