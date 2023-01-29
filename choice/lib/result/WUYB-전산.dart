import 'package:flutter/material.dart';

import '../func/home.dart';


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
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 410;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffBCF9B6),
                        Color(0xffF0FFEC),
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
                        children:[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              padding: EdgeInsets.fromLTRB(350, 20, 10, 20),
                              icon: Icon(Icons.home_outlined,color:Colors.black),
                              iconSize: 30,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Home()),
                                );
                              },
                            ),
                          ),
                          Text("당신의 추천 동아리 결과는 !! " ,
                              style: TextStyle( fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center
                          ),
                          SizedBox(
                            height: 30 * ( deviceHeight / standardDeviceHeight),
                          ),
                           Image.asset(
                                'assets/images/result/wuyb.png',
                                height: 200 * ( deviceWidth / standardDeviceWidth),
                                width: 200 * ( deviceWidth / standardDeviceWidth),
                              ),
                          SizedBox(
                            height: 30 * ( deviceHeight / standardDeviceHeight),
                          ),
                        Text('상큼하고 달콤한',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center
                        ),
                          SizedBox(
                            height: 10 * ( deviceHeight / standardDeviceHeight),
                          ),
                          Text('청사과', // 과일명
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.green,
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
              child:Container(
                color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 50 * ( deviceHeight / standardDeviceHeight),
                      ),
                      Text('"청사과 같은 당신은 아래와 같은\n동아리가 어울려요!!"',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center
                      ),
                      SizedBox(
                        height: 40 * ( deviceHeight / standardDeviceHeight),
                      ),
                      Text('• 슬기짜기\n\n• 고스트\n\n• CRA\n\n• 리눅스해커스',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      );
  }
}
