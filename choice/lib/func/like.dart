import 'package:choice/func/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'list.dart';

class Like extends StatelessWidget {
  const Like({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LikePage(),
    );
  }
}

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  int current_index = 2;
  final List<Widget> _children = [Home(), Listview(), Like(), Profile()];
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  var detail = ['전산분과 프로젝트 동아리'];

  var desc1 = ['- 학관 2층에 위치하고 있습니다.'];
  var desc2 = ['- 매주 월요일 7~8시에 정모가 있습니다.'];
  var desc3 = ['- 필수 학기는 2학기입니다.'];

  var imageList = ['assets/images/1.png'];

  Future<void> deleteHeartDoc(String name) async{
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.displayName)
        .collection("heartList").doc(name).delete();
  }

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffB9CAFE),
        toolbarHeight: 100,
        title: Text('CHOICE!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.black,
            ),
            textAlign: TextAlign.center
        ),
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
                height: 20 * (deviceHeight / standardDeviceHeight)
            ),
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
                        debugPrint(Listview.saved[index]);
                        showPopup(context, Listview.saved[index],
                            Listview.description1[Listview.titleList.indexOf(Listview.saved[index])], Listview.detail[Listview.titleList.indexOf(Listview.saved[index])], Listview.activity[Listview.titleList.indexOf(Listview.saved[index])], Listview.semester[Listview.titleList.indexOf(Listview.saved[index])],Listview.time[Listview.titleList.indexOf(Listview.saved[index])]);
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
                                          Listview.saved[index],
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
                                            Listview.description1[Listview.titleList.indexOf(Listview.saved[index])],
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
                                            Listview.description2[Listview.titleList.indexOf(Listview.saved[index])],
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
                                        icon: selected
                                            ? first_icon
                                            : second_icon,
                                        color: Colors.red,
                                        onPressed: () async {
                                          await deleteHeartDoc(Listview.saved[index]);
                                          setState(() {
                                            Listview.saved.remove(Listview.saved[index]);
                                          });
                                        }
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
