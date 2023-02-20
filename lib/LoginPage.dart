import 'package:e_blood/ForgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:e_blood/MainPage.dart';
import 'package:e_blood/SignUpPage.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;
  late String _email, _password;
  bool showState = false;
  bool isvisible = true;



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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Text("Kayıt Ol"),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(30)),
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
          Padding(padding: EdgeInsets.all(10)),
          SizedBox(
            width: 385.0,
            child: TextField(
              obscureText: isvisible,
              textAlign: TextAlign.center,
              onChanged: (val) {
                _password = val;
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isvisible = !isvisible;
                    });
                  },
                  icon: isvisible
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                ),
                border: OutlineInputBorder(),
                labelText: 'Parola',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()));
                },
                child: Text(
                  "şifremi unuttum",
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(15)),
          Container(
            width: 385.0,
            height: 60.0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () async {
                  setState(() {
                    showState = true;
                  });
                  try {
                    final newUser = await auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    print(newUser.toString());
                    if (newUser != null) {
                      Fluttertoast.showToast(
                          msg: 'Giriş Yapıldı',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 13.0);
                      setState(() {
                        showState = false;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found' &&
                        e.code == 'wrong-password') {
                      Fluttertoast.showToast(
                          msg: 'e-posta ya da şifre geçersiz..',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 15.0);
                    }
                  }
                },
                child: const Text(
                  "Giriş Yap",
                  style: TextStyle(fontSize: 16),
                )),
          ),
          const Padding(padding: EdgeInsets.all(30), ),
          Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Container(
              width: 100,
              child: IconButton(
                onPressed: (){

                },
                icon: Image.asset("assets/images/image 1.png"),
              ),
            ),
            Container(
              width: 100,
              child: IconButton(
               onPressed: () async{
                 try{
                   signInWithGoogle();
                 }
                 catch(e){
                   Fluttertoast.showToast(
                       msg: 'Lütfen tekrar deneyiniz..',
                       toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.CENTER,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.red,
                       textColor: Colors.white,
                       fontSize: 13.0);
                 }
               },
               icon: Image.asset("assets/images/image 2.png"),),
            ),
            Container(
              width: 100,
              child: IconButton(
                onPressed: (){

                },
                icon: Image.asset("assets/images/image 3.png"),
              ),
            ),
          ]),
        ],
      ),
    );
  }


  signOut() async{
    var _user=GoogleSignIn().currentUser;
    if(_user!=null){
    await GoogleSignIn().disconnect();}
    await auth.signOut();

  }

  void signInWithGoogle() async{
    final GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth= await googleUser?.authentication;

    final credential=GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage())));


  }






}

