import 'package:choice/func/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Loginhome extends StatelessWidget {
  const Loginhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (!snapshot.hasData) {
            return Login();
          }
          else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${snapshot.data?.displayName}님 반갑습니다:D", style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  TextButton(
                    child: Text('로그아웃', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                  TextButton(
                    child: Text('시작하기', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Home()));
                    },
                  ),
                  Text('초기 로그인 시, 프로필 설정 부탁드립니다!', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
