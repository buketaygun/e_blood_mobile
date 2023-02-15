
import 'package:e_blood/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'SignUpPage.dart';

class ForgotPassword extends StatefulWidget{
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  late String email;
  final auth=FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width*1,
              height: height*0.20,
              child: Image.asset('assets/images/Group 43.png', fit:BoxFit.fill ,),
            ),
            Padding(padding: EdgeInsets.all(20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    },
                    child: Text("Giriş Yap", style: TextStyle(color: Colors.red),),

                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Lütfen e-postanızı giriniz. Size kod göndereceğiz.",
                ),
                onChanged: (value){
                  setState(() {
                    email=value;
                  });
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            Container(
              width: 385.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  auth.sendPasswordResetEmail(email: email);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordAfterReset()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child:const Text(
                    'Gönder', style: TextStyle(
                  fontSize: 16
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}


class ChangePasswordAfterReset extends StatefulWidget{
  @override
  State<ChangePasswordAfterReset> createState() => _ChangePasswordAfterResetState();
}

class _ChangePasswordAfterResetState extends State<ChangePasswordAfterReset> {

  late String newPassword;
  late String newPassword2;
  final auth = FirebaseAuth.instance;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width*1,
              height: height*0.20,
              child: Image.asset('assets/images/Group 43.png', fit:BoxFit.fill ,),
            ),
            const Padding(padding: EdgeInsets.all(20),),
            SizedBox(
              width: 385.0,
              child: TextField(
                obscureText: isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: isVisible
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
                  hintText: "Lütfen yeni parolanızı giriniz. ",
                ),
                onChanged: (value) {
                  setState(() {
                    newPassword = value;
                  });
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: 385.0,
              child: TextField(
                obscureText: isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: isVisible
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
                  hintText: "Lütfen tekrar yeni parolanızı giriniz. ",
                ),
                onChanged: (value) {
                  setState(() {
                    newPassword2 = value;
                  },
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(30)),
            Container(
              width: 385.0,
              height: 60.0,
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      try {
                        if (newPassword == newPassword2) {
                          auth.currentUser?.updatePassword(newPassword);
                        }
                        else {
                          Fluttertoast.showToast(
                              msg: 'Parolalar eşleşmiyor. Tekrar deneyiniz.',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 13.0);
                        }
                      } catch (e) {
                        print("Parolalar eşleşmedi..");
                      }
                    });
                  },
                  child: Text("Kaydet")
              ),
            ),
          ],
        ),
      ),
    );
  }
}