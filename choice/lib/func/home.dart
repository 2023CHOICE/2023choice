import 'package:choice/func/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../question/1.dart';
import '../question/13.dart';
import '../result/result.dart';
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
  List<int> imageNum = [
    Random().nextInt(16) + 1,
    Random().nextInt(16) + 1,
    Random().nextInt(16) + 1,
    Random().nextInt(16) + 1
  ];
  final List<Widget> _children = [Home(), Listview(), Like(), Profile()];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('lists');

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();

    FirebaseFirestore.instance
        .collection("lists")
        .snapshots()
        .listen((snapshots) async {
      for (var doc in snapshots.docs) {
        Listview.titleList.add(doc.id);
        Listview.description1.add(doc.get('result1'));
        Listview.description2.add(doc.get('result2'));
        Listview.detail.add(doc.get('detail'));
        Listview.activity.add(doc.get('activity'));
        Listview.semester.add(doc.get('semester'));
        Listview.time.add(doc.get('time'));
      }
    });
  }

  Future<void> getResultList() async {
    var result = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.displayName)
        .collection("testResult")
        .get();

    for (var doc in result.docs) {
      Result.resultName.add(doc.get('character'));
      Result.resultTime.add(doc.get('dateTime'));
      var name = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.displayName)
          .collection("testResult")
          .doc(doc.get('character'))
          .collection('listName')
          .get();
      List<String> list = [];
      for (var n in name.docs) {
        list.add(n.get('list'));
      }
      Result.resultListName.add(list);
    }
  }

  Future<void> getHeartList() async {
    var heart = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.displayName)
        .collection("heartList")
        .get();

    for (var doc in heart.docs) {
      Listview.saved.add(doc.get('listName'));
    }
  }

  Future<void> setData() async {
    Profile.m = 0;
    Profile.w = 0;
    Profile.h = 0;
    Profile.y = 0;
    Profile.d = 0;
    Profile.b = 0;
    Profile.nlist[0] = 0;
    Profile.nlist[1] = 0;
    Profile.nlist[2] = 0;
    Profile.nlist[3] = 0;
    Profile.body = 0;
    Profile.tool = 0;
    Profile.study = 0;
    Profile.com = 0;
    Profile.volunteer = 0;
    Question13.listName.clear();
    Question13.picUrl = "";
  }

  ConfettiController _controllerCenter = ConfettiController();

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  Path drawHeart(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();

    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    if (Result.resultName.isEmpty) getResultList();
    if (Listview.saved.isEmpty) getHeartList();
    if (Listview.titleList.isEmpty &&
        Listview.description1.isEmpty &&
        Listview.description2.isEmpty &&
        Listview.detail.isEmpty &&
        Listview.semester.isEmpty &&
        Listview.activity.isEmpty  &&
        Listview.time.isEmpty) getData();
    setData();
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return SafeArea(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(300, 30, 10, 0),
                          color: Colors.white,
                          height: 0.5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              minimumSize: const Size(30, 30),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black45,
                              side: const BorderSide(
                                width: 2.0,
                                color: Colors.black45,
                              ),
                            ),
                            child: Text(
                              'logout',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold
                              ),
                            ),
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
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
                                    textAlign: TextAlign.center
                                ),
                                Text('CHOICE!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    180 * (deviceHeight / standardDeviceHeight),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Character(0, _controllerCenter, imageNum,
                                        imageNum[0]
                                    ),
                                    Character(1, _controllerCenter, imageNum,
                                        imageNum[1]
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    20 * (deviceHeight / standardDeviceHeight),
                              ),
                              SizedBox(
                                height:
                                    180 * (deviceHeight / standardDeviceHeight),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Character(2, _controllerCenter, imageNum,
                                        imageNum[2]
                                    ),
                                    Character(3, _controllerCenter, imageNum,
                                        imageNum[3]
                                    ),
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
                            vertical: 10,
                          ),
                          color: Colors.white,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              side: const BorderSide(
                                width: 3.0,
                                color: Colors.black,
                              ),
                              minimumSize: const Size(380, 30),
                            ),
                            child: Text(
                              '테스트 시작하기',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Question1()
                                ),
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
                            vertical: 10,
                          ),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: true,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ],
                    createParticlePath: drawHeart,
                  ),
                ),
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
  int imageIndex;
  List<int> imageNum;
  int characterNumber;
  ConfettiController _controllerCenter;

  Character(this.imageIndex, this._controllerCenter, this.imageNum,
      this.characterNumber);

  @override
  _CharacterState createState() => _CharacterState(this.imageIndex,
      this._controllerCenter, this.imageNum, this.characterNumber);
}

class _CharacterState extends State<Character> {
  int imageIndex;
  List<int> imageNum;
  int characterNumber;
  ConfettiController _controllerCenter;

  _CharacterState(this.imageIndex, this._controllerCenter, this.imageNum,
      this.characterNumber);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            characterNumber = Random().nextInt(16) + 1;
            this.imageNum[this.imageIndex] = characterNumber;
            if (this.imageNum[0] == this.imageNum[1] &&
                this.imageNum[1] == this.imageNum[2] &&
                this.imageNum[2] == this.imageNum[3]) {
              _controllerCenter.play();
            }
          });
        },
        child: Image.asset('assets/images/home/$characterNumber.png'),
      ),
    );
  }
}
