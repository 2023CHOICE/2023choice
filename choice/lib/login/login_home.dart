import 'package:choice/func/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Loginhome extends StatelessWidget {
  const Loginhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (!snapshot.hasData) {
            return Login();
          }
          else {
            final userCollectionReference = FirebaseFirestore.instance.collection("users").doc(snapshot.data?.displayName);
            userCollectionReference.set({
              "userName" : snapshot.data?.displayName,
            });
            return Home();
          }
        },
      ),
    );
  }
}