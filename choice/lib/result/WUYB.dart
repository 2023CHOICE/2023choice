import 'package:flutter/material.dart';

import '../func/home.dart';
import '../func/list.dart';

class WUYB extends StatelessWidget {
  const WUYB({super.key});

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
  final List<Widget> _children = [Home(), Listview(), Home(), Home()];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 410;

    return Scaffold(
      backgroundColor: Color(0xffF0FFEC),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xffF0FFEC),
                child: Center(
                  child: Text('당신의 추천 동아리 결과는!!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Color(0xffF0FFEC),
                child: Center(
                  child: Image.asset(
                    'assets/images/result/wuyb.png',
                    height: 200 * ( deviceWidth / standardDeviceWidth),
                    width: 200 * ( deviceWidth / standardDeviceWidth),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20 * ( deviceWidth / standardDeviceWidth),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xffF0FFEC),
                child: Center(
                  child: Column(
                    children: [ // 호칭
                      Text('상큼하고 달콤한',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center),
                      Text('청사과', // 과일명
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xffF0FFEC),
                child: Center(
                  child: Column(
                    children: [
                      Text('청사과 같은 당신은 아래와 같은\n동아리가 어울려요!!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Color(0xffF0FFEC),
                child: Center(
                  child: Text('슬기짜기\n\n고스트\n\nCRA\n\n리눅스해커스',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center),
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
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
