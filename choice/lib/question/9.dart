import 'package:flutter/material.dart';
import '../func/home.dart';
import '../func/list.dart';
import '../func/profile.dart';
import '10.dart';
import '2.dart';
import '4.dart';
import '8.dart';

class Question9 extends StatelessWidget {
  const Question9({super.key});

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 30
                          ),
                          icon: Image.asset('assets/images/left.png'),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Question8()),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40 * ( deviceHeight / standardDeviceHeight),
                    ),
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          'assets/images/bar/bar9.png',
                          height: 50 * ( deviceWidth / standardDeviceWidth),
                          width: 350 * ( deviceWidth / standardDeviceWidth),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40 * ( deviceHeight / standardDeviceHeight),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 120 * ( deviceHeight / standardDeviceHeight),
                      child: Text('9. 만약 10대 1로 싸우는 꿈을 꾸었다\n이때 당신이 상대방과 맞서 싸우는\n방식은?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center
                      ),
                    ),
                    SizedBox(
                      height: 290 * ( deviceHeight / standardDeviceHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    primary: Color(0xffB9CAFE),
                                    minimumSize: Size(380, 80),
                                    alignment: Alignment.center,
                                    textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                                ),
                                child: Column(
                                  children: [
                                    Text('자존심이 허락 못한다',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                    Text('맨몸으로 싸운다',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                onPressed: () {
                                  Profile.m += 20;
                                  Profile.body += 10;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Question10()),
                                  );
                                },
                              )
                          ),
                          InkWell(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    primary: Color(0xffFF9281),
                                    minimumSize: Size(380, 80),
                                    alignment: Alignment.center,
                                    textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                                ),
                                child: Column(
                                  children: [
                                    Text('도구를 이용하여 싸운다',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                onPressed: () {
                                  Profile.m += 20;
                                  Profile.tool += 10;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Question10()),
                                  );
                                },
                              )
                          ),
                          InkWell(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    primary: Color(0xffFFB181),
                                    minimumSize: Size(380, 80),
                                    alignment: Alignment.center,
                                    textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                                ),
                                child: Column(
                                  children: [
                                    Text('나는 평화주의자',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                    Text('싸우지 않는다',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                onPressed: () {
                                  Profile.w += 10;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Question10()),
                                  );
                                },
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
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
