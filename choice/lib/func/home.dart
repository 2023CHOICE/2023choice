import 'package:cloud_firestore/cloud_firestore.dart';
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
  final List<Widget> _children = [Home(), Listview(), Like(), Home()];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  CollectionReference _collectionRef = FirebaseFirestore.instance.collection('lists');

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();

    FirebaseFirestore.instance.collection("lists").snapshots().listen((snapshots) async {
      for(var doc in snapshots.docs){
        Listview.titleList.add(doc.id);
        Listview.description1.add(doc.get('result1'));
        Listview.description2.add(doc.get('result2'));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    if(Listview.titleList.isEmpty && Listview.description1.isEmpty && Listview.description2.isEmpty) getData();

    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;
    return Scaffold(
      body:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding:EdgeInsets.fromLTRB(300, 50, 10, 0),
                    color: Colors.white,
                    height: 1.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(10)
                        ),
                        minimumSize: const Size(20, 20),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black45,
                        side: const BorderSide(
                          width: 2.0, color: Colors.black45,
                        ),
                      ),
                      child: Text('logout',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding:EdgeInsets.fromLTRB(0, 70, 0, 0),
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
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
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
                        minimumSize: const Size(380, 30),
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
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
                    ),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: current_index,
        backgroundColor: Colors.black,
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _children[index]),
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '리스트',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '찜',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '프로필',
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
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
          });
        },
        child: Image.asset('assets/images/home/$characterNumber.png'),
      ),
    );
  }
}