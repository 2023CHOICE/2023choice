import 'package:choice/func/like.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../result/result.dart';
import 'home.dart';
import 'list.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  static int m = 0;
  static int w = 0;
  static int h = 0;
  static int y = 0;
  static int d = 0;
  static int b = 0;

  static List<dynamic> nlist = [0, 0, 0, 0]; // MYD, MHD 일 시 사용

  static int body = 0; // MYB, MHB - 도구X 일 시 사용
  static int tool = 0; // MYB, MHB - 도구O 일 시 사용

  static int com = 0; // WYB-전산 일 시 사용
  static int study = 0; // WYB-전산 외 일 시 사용

  static int volunteer = 0; //WYB-봉사 일 시 사용

  static String mw = '';
  static String hy = '';
  static String db = '';

  static String getResult() {
    if (m > w)
      mw = 'M';
    else
      mw = 'W';
    if (h > y)
      hy = 'H';
    else
      hy = 'Y';
    if (d > b)
      db = 'D';
    else
      db = 'B';

    String result = mw + hy + db;

    if (result == 'MYD' || result == 'MHD') {
      int max = nlist[0];
      for (var element in nlist) {
        if (element > max) {
          max = element;
        }
      }
      int maxindex = nlist.indexOf(max);
      print(maxindex);
      if (maxindex == 0)
        result += '-춤';
      else if (maxindex == 1)
        result += '-노래,랩';
      else if (maxindex == 2)
        result += '-악기';
      else
        result += '-밴드';
    }

    if (result == 'MYB' || result == 'MHB') {
      if (body > tool)
        result += '-도구X';
      else
        result += '-도구O';
    }

    if (result == 'WYB') {
      if (volunteer != 0)
        result += '-봉사';
      else {
        if (com > study)
          result += '-전산';
        else
          result += '-전산 외';
      }
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
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void showPopup(context, title, detail, String desc) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: 500,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 1.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(30),
                color: Colors.white
            ),
            child: SingleChildScrollView(
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
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 95,
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
          ),
        );
      },
    );
  }

  _buildExpandableContent(List<String> namelist) {
    List<Widget> columnContent = [];

    for (String content in namelist)
      columnContent.add(
        ListTile(
          title: Text(
            content,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );

    return columnContent;
  }

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
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Color(0xffB9CAFE),
                toolbarHeight: 100,
                title: Text('PROFILE!',
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
              body: Column(
                children: <Widget>[
                  SizedBox(height: 20 * (deviceHeight / standardDeviceHeight)),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      color: Colors.white,
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                            ),
                            SizedBox(
                              width: 10 * (deviceHeight / standardDeviceHeight),
                            ),
                            Text(
                              '개인프로필',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      color: Colors.white,
                      child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.face_retouching_natural,
                                    size: 130,
                                  ),
                                  SizedBox(
                                    width:
                                    10 * (deviceHeight / standardDeviceHeight),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snapshot.data?.displayName}',
                                        style: TextStyle(
                                          height: 1,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10 *
                                            (deviceHeight / standardDeviceHeight),
                                      ),
                                      Text(
                                        '${snapshot.data?.email}',
                                        style: TextStyle(
                                          height: 1,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10 * (deviceHeight / standardDeviceHeight),
                              ),
                              Container(
                                height: 1.0,
                                width: 500.0,
                                color: Colors.black,
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      color: Colors.white,
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.update,
                            ),
                            SizedBox(
                              width: 10 * (deviceHeight / standardDeviceHeight),
                            ),
                            Text(
                              '최근 테스트 결과',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      color: Colors.white,
                      child: ListView.builder(
                          itemCount: Result.resultName.length,
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              title: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child:Container(
                                          width: 330.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF5F5F5),
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  height: 10 *
                                                      (deviceHeight /
                                                          standardDeviceHeight)
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20 *
                                                        (deviceWidth /
                                                            standardDeviceWidth),
                                                  ),
                                                  SizedBox(
                                                    width: 120 *
                                                        (deviceWidth /
                                                            standardDeviceWidth),
                                                    child: Text(
                                                      Result.resultName[index],
                                                      style: const TextStyle(
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30 *
                                                        (deviceWidth /
                                                            standardDeviceWidth),
                                                  ),
                                                  SizedBox(
                                                    width: 130 *
                                                        (deviceWidth /
                                                            standardDeviceWidth),
                                                    child: Container(
                                                      child: Text(
                                                        Result.resultTime[index],
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Color(0xffF28220)),
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
                                                ],
                                              ),
                                              SizedBox(
                                                  height: 10 *
                                                      (deviceHeight /
                                                          standardDeviceHeight)
                                              ),
                                            ], //children
                                          )
                                      ),
                                    ),
                                  ]),
                              children: <Widget>[
                                Column(
                                  children: _buildExpandableContent(
                                      Result.resultListName[index]),
                                ),
                              ],
                            );
                        }),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      color: Colors.white,
                      child: Center(
                          child: Column(
                            children: [
                              Container(
                                height: 1.0,
                                width: 500.0,
                                color: Colors.black,
                              ),
                              SizedBox(
                                  height: 10 * (deviceHeight / standardDeviceHeight)
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.red, // foreground
                                      backgroundColor: Colors.white,
                                    ),
                                    child: Text('학회에 대해 궁금하시다면??',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                          color: Colors.black54,
                                        ),
                                        textAlign: TextAlign.center
                                    ),
                                    onPressed: () {
                                      showPopup(context, "한동대학교 학회", "각 전공별 학회 리스트",
                                          "<경영경제학부>\n컬러즈\n정치경제학회\n———————————\n<공간시스템공학부>\n한.땅\n공기\n———————————\n<국제어문학부>\n살루스\n한동교육학회\n———————————\n<기계제어학부>\n하다\n———————————\n<법학부>\n하나인\n고전강독학회\n———————————\n<상담복지학부>\n한동마음지킴이\n예술심리치료학회\n———————————\n<ICT창업학부>\nBEST\nSirius\n———————————\n<전산전자공학부>\n시선\nSODA\n———————————\n<커뮤케이션학부>\n언로너스\n카존\n———————————\n<콘텐융합디자인학부>\n도트\n매직\n———————————\n<생과학학부>\n로직 디자이너스");
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
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
