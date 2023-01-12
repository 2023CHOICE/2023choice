import 'package:choice/func/home.dart';
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
            return Home();
          }
        },
      ),
    );
  }
}
