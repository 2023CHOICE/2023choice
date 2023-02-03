import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 410;

    return Scaffold(
      body:  Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text('Choice Login',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100 * ( deviceHeight / standardDeviceHeight),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //to set border radius to button
                    borderRadius: BorderRadius.circular(10)
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                side: const BorderSide(
                  width: 3.0, color: Colors.black12,
                ),
              ),
              child: Image.asset(
                'assets/images/google.png',
                height: 50 * ( deviceWidth / standardDeviceWidth),
                width: 250 * ( deviceWidth / standardDeviceWidth),
              ),
              onPressed: signInWithGoogle,
            ),
            SizedBox(
              height: 70 * ( deviceHeight / standardDeviceHeight),
            ),
          ],
        ),
      ),
    );
  }
}