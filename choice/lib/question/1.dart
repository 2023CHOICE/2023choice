import 'package:flutter/material.dart';
import '../func/home.dart';
import '../func/list.dart';
import '../func/profile.dart';
import '2.dart';

class Question1 extends StatelessWidget {
  const Question1({super.key});

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
  final List<Widget> _children = [Home(), Listview(), Home(), Profile()];
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
                          icon: Icon(
                              Icons.home_outlined,
                              color: Colors.black
                          ),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home()
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40 * (deviceHeight / standardDeviceHeight),
                    ),
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          'assets/images/bar/bar1.png',
                          height: 50 * (deviceHeight / standardDeviceHeight),
                          width: 350 * (deviceWidth / standardDeviceWidth),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40 * (deviceHeight / standardDeviceHeight),
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
                      height: 120 * (deviceHeight / standardDeviceHeight),
                      child: Text(
                          '1. 다시 태어나보니 내가 탑급 연예인?\n'
                          '어떤 연예인이 되고 싶은가?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center
                      ),
                    ),
                    SizedBox(
                      height: 260 * (deviceHeight / standardDeviceHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 75 * (deviceWidth / standardDeviceWidth),
                              ),
                              InkWell(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Profile.nlist[2] += 10;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Question2()
                                        )
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: const Size(120, 120),
                                    backgroundColor: const Color(0xffB9CAFE),
                                  ),
                                  child: Text(
                                    "연주자",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15 * (deviceWidth / standardDeviceWidth),
                              ),
                              InkWell(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Profile.nlist[0] += 10;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Question2()
                                        )
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: const Size(120, 120),
                                    backgroundColor: const Color(0xffFF9281),
                                  ),
                                  child: Text(
                                    "댄서",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10 * (deviceWidth / standardDeviceWidth),
                              ),
                              InkWell(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Profile.nlist[3] += 10;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Question2()
                                        )
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: const Size(120, 120),
                                    backgroundColor: const Color(0xffFF9281),
                                  ),
                                  child: Text(
                                    "밴드",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15 * (deviceWidth / standardDeviceWidth),
                              ),
                              InkWell(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Profile.nlist[1] += 10;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Question2()
                                        )
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: const Size(120, 120),
                                    backgroundColor: const Color(0xffFFB181),
                                  ),
                                  child: Text(
                                    "가수",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15 * (deviceWidth / standardDeviceWidth),
                              ),
                              InkWell(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Question2()
                                        )
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: const Size(120, 120),
                                    backgroundColor: const Color(0xffB9CAFE),
                                  ),
                                  child: Text(
                                    "배우",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
