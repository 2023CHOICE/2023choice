import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../question/1.dart';
import 'like.dart';
import 'list.dart';
class Home extends StatelessWidget {
  const Home({super.key});

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
  int current_index = 0;
  final List<Widget> _children = [Home(), Listview(),Like(), Home()];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;
    return Scaffold(
      body:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding:EdgeInsets.fromLTRB(0, 150, 0, 0),
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        children: [
                          Text('${snapshot.data?.displayName}의\n',
                              style: TextStyle(
                                height: 0.1,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center),
                          Text('CHOICE!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 180 * ( deviceHeight / standardDeviceHeight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Character(),
                              Character(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20 * ( deviceHeight / standardDeviceHeight),
                        ),
                        SizedBox(
                          height: 180 * ( deviceHeight / standardDeviceHeight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Character(),
                              Character(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 85
                    ),
                    color: Colors.white,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(10)
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: const BorderSide(
                          width: 3.0, color: Colors.black,
                        ),
                        minimumSize: const Size(380, 50),
                      ),
                      child: Text('테스트 시작하기',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Question1()),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class Character extends StatefulWidget {
  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  int characterNumber = Random().nextInt(16) + 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            characterNumber = Random().nextInt(16) + 1;
            print('I got clicked: $characterNumber');
          });
        },
        child: Image.asset('assets/images/$characterNumber.png'),
      ),
    );
  }
}