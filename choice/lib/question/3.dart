import 'package:flutter/material.dart';
import '../func/home.dart';
import '../func/list.dart';
import '../func/profile.dart';
import '4.dart';

class Question3 extends StatelessWidget {
  const Question3({super.key});

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

  void showPopup(context, title, detail, desc) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: 220,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 1.0, style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(30),
                color: Colors.white
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
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
                        width: 100,
                      ),
                      Text(
                        desc,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
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
                          'assets/images/bar/bar3.png',
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
                      child: Column(
                        children: [
                          Text('3. 당신은 mnt에 소속되기를 원하는가?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.red, // foreground
                              backgroundColor: Colors.white,
                            ),
                            child: Text('#mnt?',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center
                            ),
                            onPressed: () {
                              showPopup(context,
                                  "MNT란?",
                                  "Mission And Talent",
                                  "한동대 문화선교사역단체"
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 220 * (deviceHeight / standardDeviceHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    primary: Color(0xffB9CAFE),
                                    minimumSize: Size(380, 90),
                                    alignment: Alignment.center,
                                    textStyle: const TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold)
                                ),
                                child: Text('그렇다',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                    textAlign: TextAlign.center
                                ),
                                onPressed: () {
                                  Profile.h += 10;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Question4()
                                    ),
                                  );
                                },
                              )),
                          InkWell(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    primary: Color(0xffFF9281),
                                    minimumSize: Size(380, 90),
                                    alignment: Alignment.center,
                                    textStyle: const TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold
                                    )
                                ),
                                child: Text('아니다',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                    textAlign: TextAlign.center
                                ),
                                onPressed: () {
                                  Profile.y += 10;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Question4()
                                    ),
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
    );
  }
}
