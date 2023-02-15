import 'package:e_blood/LoginPage.dart';
import 'package:e_blood/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInGoogle extends StatefulWidget{
  @override
  State<SignInGoogle> createState() => _SignInGoogleState();
}

class _SignInGoogleState extends State<SignInGoogle> {

  TextEditingController emailController= TextEditingController();
  final auth = FirebaseAuth.instance;
  late String _email;
  bool showState = false;
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: width * 1,
            height: height * 0.20,
            child: Image.asset(
              'assets/images/Group 43.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          SizedBox(
            width: 385.0,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (val) {
                _email = val;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-posta',
              ),
            ),
          ),
          signInWithGoogle1(),
        ],
      ),
    );
  }


  signInWithGoogle1() async{

    final GoogleSignInAccount? googleUser= await GoogleSignIn(
      scopes: <String>["email"]).signIn();


    final GoogleSignInAuthentication googleAuth= await googleUser!.authentication;


    final credential=GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

  signOut(){
    FirebaseAuth.instance.signOut();
  }

}