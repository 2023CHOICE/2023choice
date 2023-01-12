import 'package:choice/login/login_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future:  Firebase.initializeApp(),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return Center(
            child: Text("Firebase load fail"),
          );
        }
        if(snapshot.connectionState == ConnectionState.done) {
          return Loginhome();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
