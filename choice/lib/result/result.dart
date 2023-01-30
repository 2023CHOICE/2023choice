import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../func/home.dart';
import '../../func/list.dart';
import '../../question/13.dart';
import '../func/profile.dart';


class Result extends StatelessWidget {
  const Result({super.key});

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
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    final standardDeviceHeight = 900;
    final deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    final standardDeviceWidth = 410;

    return Scaffold (
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
                    bottomLeft:
                    Radius.circular(50)
                ),
              ),
              child: Center(
                child: Container(
                  padding: new EdgeInsets.all(30.0),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                padding: EdgeInsets.fromLTRB(350, 20, 10, 20),
                                icon: Icon(
                                    Icons.home_outlined, color: Colors.black),
                                iconSize: 30,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                },
                              ),
                            ),
                            Image.asset(
                              'assets/images/result/wuyb.png',
                              height: 100 * (deviceWidth / standardDeviceWidth),
                              width: 100 * (deviceWidth / standardDeviceWidth),
                            ),
                            Text('당신은 한동의',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center
                            ),
                            Text(Question13.character, // 과일명
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
            flex: 6,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50 * (deviceHeight / standardDeviceHeight),
                  ),
                  Text('"'+Question13.character+'과 닮은 당신은 아래와 같은\n동아리가 어울려요!!"',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center
                  ),
                  SizedBox(
                    height: 40 * (deviceHeight / standardDeviceHeight),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child : Text(Question13.listnames,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.black54,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.left
                    ),
                  ),
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

                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
