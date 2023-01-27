import 'dart:math';

import 'package:choice/func/like.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'list.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  static int m = 0;
  static int w = 0;
  static int v = 0;
  static int u = 0;
  static int h = 0;
  static int y = 0;
  static int d = 0;
  static int b = 0;

  static List<dynamic> nlist = [0,0,0,0]; // MUYD, MUHD 일 시 사용

  static int body = 0; // MUYB - 도구X 일 시 사용
  static int tool = 0; // MUYB - 도구O 일 시 사용

  static int com = 0; // WUYB - 전산 일 시 사용
  static int study = 0; // WUYB - 전산 외 일 시 사용

  static String mw = '';
  static String vu = '';
  static String hy = '';
  static String db = '';


  static String getResult() {
    if(m>w) mw = 'M';
    else mw = 'W';
    if(v>u) vu = 'V';
    else vu = 'U';
    if(h>y) hy = 'H';
    else hy = 'Y';
    if(d>b) db = 'D';
    else db = 'B';

    String result = mw+vu+hy+db;

    if(result == 'MUYD' || result == 'MUHD') {
      int max = nlist[0];
      for (var element in nlist) {
        if (element > max) {
          max = element;
        }
      }
      int maxindex = nlist.indexOf(max);
      print(maxindex);
      if(maxindex==0) result += '_dance';
      else if(maxindex==1) result += '_sing';
      else if(maxindex==1) result += '_inst';
      else result += '_band';
    }

    if(result == 'MUYB') {
      if(body>tool) result += '-도구X';
      else result += '-도구O';
    }

    if(result == 'WUYB') {
      if(com>study) result += '-전산';
      else result += '-전산 외';
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int current_index = 3;
  final List<Widget> _children = [Home(), Listview(), Like(), Profile()];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void showPopup(context, title, image, description, detail, String desc1, String desc2, String desc3) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
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
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    detail,
                    maxLines: 3,
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: [
                          Text(
                            desc1,
                            style: const TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            desc2,
                            style: const TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            desc3,
                            style: const TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
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
    bool selected = false;
    Icon first_icon = Icon(Icons.favorite_border);
    Icon second_icon = Icon(Icons.favorite);

    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;

    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 410;

    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB9CAFE),
        toolbarHeight: 100,
        title: Text('CHOICE!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.black,
            ),
            textAlign: TextAlign.center),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        thickness: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
                height: 20 * (deviceHeight / standardDeviceHeight)),
            Expanded(
              flex: 9,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: Listview.saved.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        debugPrint(Listview.titleList[index]);
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
                                width: 30 * (deviceWidth / standardDeviceWidth)),
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 10 * (deviceHeight / standardDeviceHeight)),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 120 * (deviceWidth / standardDeviceWidth),
                                        child: Text(
                                          Listview.saved[index],
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
                                            Listview.description1[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xffF28220)),
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
                                                color: Color(0xff3FD69F)),
                                          ),
                                          //margin: const EdgeInsets.all(10.0),
                                          width: 100.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xffE7FAF7),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 35 * (deviceWidth / standardDeviceWidth),
                                      ),
                                      IconButton(
                                          icon: selected
                                              ? first_icon
                                              : second_icon,
                                          color: Colors.red,
                                          onPressed: () {
                                            try {
                                              // your code that you want this IconButton do
                                              setState(() {
                                                selected  = !selected;
                                              });
                                            } catch(e) {
                                              print(e);
                                            }
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                      height: 10 * (deviceHeight / standardDeviceHeight)),
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
