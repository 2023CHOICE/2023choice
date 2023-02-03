import 'package:choice/func/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'like.dart';

class Listview extends StatelessWidget {
  const Listview({Key? key}) : super(key: key);
  static List<String> titleList = [];
  static List<String> description1 = [];
  static List<String> description2 = [];
  static List<String> detail = [];
  static List<String> activity = [];
  static List<String> semester = [];
  static List<String> time= [];
  static List<String> saved = [];

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);
  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
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

  FirebaseAuth auth = FirebaseAuth.instance;
  int current_index = 1;

  final List<Widget> _children = [Home(), Listview(), Like(), Profile()];
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void showPopup(context, title, description, detail, desc1, desc2, desc3) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 1.0,
            height: 220,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                    height: 30
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    detail,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[500]
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 105,
                      ),
                      Column(
                        children: [
                          Text('활동: '+
                              desc1,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text('필수 학기: '+desc2+'학기',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text('시간: '
                              +desc3,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Icon first_icon = Icon(Icons.favorite_border);
    Icon second_icon = Icon(Icons.favorite);

    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;

    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 410;

    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            iconSize: 25,
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              showSearch(context: context, delegate: Search(Listview.titleList));
            },
          ),
        ],
      ),
      body: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        thickness: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 9,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: Listview.titleList.length,
                  itemBuilder: (context, index) {
                    final alreadySaved = Listview.saved.contains(Listview.titleList[index]);
                    return InkWell(
                      onTap: () {
                        debugPrint(Listview.titleList[index]);
                        showPopup(context, Listview.titleList[index],
                            Listview.description1[index], Listview.detail[index], Listview.activity[index], Listview.semester[index],Listview.time[index]);
                      },
                      child: Card(
                        color: Color(0xffF5F5F5),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
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
                                          Listview.titleList[index],
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70 * (deviceWidth / standardDeviceWidth),
                                        child: Container(
                                          child: Text(
                                            Listview.description1[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xffF28220)
                                            ),
                                          ),
                                          //margin: const EdgeInsets.all(10.0),
                                          width: 100.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFEF0E3),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70 * (deviceWidth / standardDeviceWidth),
                                        child: Container(
                                          child: Text(
                                            Listview.description2[index],
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
                                            borderRadius: BorderRadius.circular(20),
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
                                          color:
                                          alreadySaved ? Colors.red : null,
                                          semanticLabel: alreadySaved
                                              ? 'Remove from saved'
                                              : 'Save',
                                        ),
                                        onPressed: () async {
                                          if (alreadySaved) {
                                            await deleteHeartDoc(Listview.titleList[index]);
                                          } else {
                                            await createHeartDoc(Listview.titleList[index]);
                                          }
                                          setState(() {
                                            if (alreadySaved) {
                                              Listview.saved.remove(Listview.titleList[index]);
                                            } else {
                                              Listview.saved.add(Listview.titleList[index]);
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
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
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

class Search extends SearchDelegate {
  void showPopup(context, title, description, detail, desc1, desc2, desc3) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 1.0,
            height: 220,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                    height: 30
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    detail,
                    maxLines: 3,
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 105,
                      ),
                      Column(
                        children: [
                          Text('활동: '+
                              desc1,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text('필수 학기: '+desc2+'학기',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text('시간: '
                              +desc3,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Listview()
          ),
        );
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  final List<String> listExample;

  Search(this.listExample);

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;

    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 410;

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

    query.isEmpty
        ? suggestionList = [] //In the true case
        : suggestionList.addAll(listExample.where(
          (element) => element.contains(query),
    ));
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: suggestionList.length,
              itemBuilder: (context, index) {
                final alreadySaved = Listview.saved.contains(suggestionList[index]);
                return InkWell(
                  onTap: () {
                    debugPrint(suggestionList[index]);
                    showPopup(context, suggestionList[index],
                        Listview.description1[Listview.titleList.indexOf(suggestionList[index])], Listview.detail[Listview.titleList.indexOf(suggestionList[index])], Listview.activity[Listview.titleList.indexOf(suggestionList[index])], Listview.semester[Listview.titleList.indexOf(suggestionList[index])],Listview.time[Listview.titleList.indexOf(suggestionList[index])]);
                  },
                  child: Card(
                    color: Color(0xffF5F5F5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
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
                                      suggestionList[index],
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70 * (deviceWidth / standardDeviceWidth),
                                    child: Container(
                                      child: Text(
                                        Listview.description1[Listview.titleList.indexOf(suggestionList[index])],
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
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70 * (deviceWidth / standardDeviceWidth),
                                    child: Container(
                                      child: Text(
                                        Listview.description2[Listview.titleList.indexOf(suggestionList[index])],
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
                                        borderRadius: BorderRadius.circular(20),
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
                                      color:
                                      alreadySaved ? Colors.red : null,
                                      semanticLabel: alreadySaved
                                          ? 'Remove from saved'
                                          : 'Save',
                                    ),
                                    onPressed: () async {
                                      if (alreadySaved) {
                                        await deleteHeartDoc(suggestionList[index]);
                                      } else {
                                        await createHeartDoc(suggestionList[index]);
                                      }
                                      setState(() {
                                        if (alreadySaved) {
                                          Listview.saved.remove(suggestionList[index]);
                                        } else {
                                          Listview.saved.add(suggestionList[index]);
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
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      );
  }
}
