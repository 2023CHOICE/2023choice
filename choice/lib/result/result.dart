import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../func/home.dart';
import '../../func/list.dart';
import '../../question/13.dart';
import '../func/profile.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  static const String _title = 'Flutter Code Sample';
  static List<String> resultName = [];
  static List<List<String>> resultListName = [];
  static List<String> resultTime = [];

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
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final ScrollController _scrollController = ScrollController();

  Future<void> createResultDoc(String name) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.displayName)
        .collection("testResult")
        .doc(name)
        .set({
      "character": name,
      "dateTime": DateFormat.yMd().add_jm().format(DateTime.now()),
    });
    for(int i = 0; i< Question13.listName.length; i++){
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.displayName)
          .collection("testResult")
          .doc(name)
          .collection('listName')
          .doc(Question13.listName[i])
          .set({
        'list': Question13.listName[i],
      });
    }
  }

  Future<void> createHeartDoc(String name) async{
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.displayName)
        .collection("heartList")
        .doc(name)
        .set({ 'listName' : name });
  }

  Future<void> deleteHeartDoc(String name) async{
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.displayName)
        .collection("heartList").doc(name).delete();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 410;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(Question13.colorNum),
                    Color(Question13.colorNum),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(50)),
              ),
              child: Center(
                child: Container(
                  padding: new EdgeInsets.all(30.0),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            padding: EdgeInsets.fromLTRB(350, 20, 10, 20),
                            icon:
                                Icon(Icons.home_outlined, color: Colors.black),
                            iconSize: 30,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                          ),
                        ),
                        Image.network(
                          Question13.picUrl,
                          height: 150 * (deviceHeight / standardDeviceHeight),
                          width: 150 * (deviceWidth / standardDeviceWidth),
                        ),
                        SizedBox(
                          height: 5 * (deviceHeight / standardDeviceHeight),
                        ),
                        Text('당신은 한동의',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center
                        ),
                        Text(
                          "\"" + Question13.character + "\"", // 과일명
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(Question13.colorNum - 30000),
                          ),
                        ),
                      ]
                    )
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Text(
                  '\n"' +
                      Question13.character +
                      '"을(를) 닮은 당신은\n아래와 같은 동아리가 어울려요!!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Scrollbar(
                controller: _scrollController,
                thickness: 10,
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: Question13.listName.length,
                    itemBuilder: (context, index) {
                      final alreadySaved =
                          Listview.saved.contains(Question13.listName[index]);
                      return Card(
                        color: Color(0xffF5F5F5),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(children: [
                          SizedBox(
                              height: 50 * (deviceHeight / standardDeviceHeight),
                              width: 30 * (deviceWidth / standardDeviceWidth)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 10 * (deviceHeight / standardDeviceHeight)
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 140 * (deviceWidth / standardDeviceWidth),
                                      child: Text(
                                        Question13.listName[index],
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70 * (deviceWidth / standardDeviceWidth),
                                      child: Container(
                                        child: Text(
                                          Listview.description1[Listview.titleList.indexOf(Question13.listName[index])],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xffF28220)
                                          ),
                                        ),
                                        width: 100.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFEF0E3),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70 *
                                          (deviceWidth / standardDeviceWidth),
                                      child: Container(
                                        child: Text(
                                          Listview.description2[Listview.titleList.indexOf(Question13.listName[index])],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff3FD69F)
                                          ),
                                        ),
                                        width: 100.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xffE7FAF7),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30 * (deviceWidth / standardDeviceWidth),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        alreadySaved
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: alreadySaved ? Colors.red : null,
                                        semanticLabel: alreadySaved
                                            ? 'Remove from saved'
                                            : 'Save',
                                      ),
                                      onPressed: () async {
                                        if (alreadySaved) {
                                          await deleteHeartDoc(
                                              Question13.listName[index]);
                                        } else {
                                          await createHeartDoc(
                                              Question13.listName[index]);
                                        }
                                        setState(() {
                                          if (alreadySaved) {
                                            Listview.saved.remove(
                                                Question13.listName[index]);
                                          } else {
                                            Listview.saved
                                                .add(Question13.listName[index]);
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: 10 * (deviceHeight / standardDeviceHeight)
                                ),
                              ], //children
                            ),
                          ),
                        ]),
                      );
                    }
                  ),
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
                  '결과 저장하기',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () async {
                  await createResultDoc(Question13.character);
                  Result.resultName.add(Question13.character);
                  Result.resultListName.add(Question13.listName);
                  Result.resultTime.add(DateFormat.yMd().add_jm().format(DateTime.now()));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile()
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
