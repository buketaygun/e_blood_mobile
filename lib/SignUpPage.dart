import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood/LoginPage.dart';
import 'MainPage.dart';


class SignUpPage extends StatefulWidget{

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _key=GlobalKey<FormState>();
  TextEditingController _emailcontroller= TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  TextEditingController _namecontroller= TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;

  Reference ref=FirebaseStorage.instance.ref().child("blank-profile-picture-973460_1280.webp");

  bool requestBlood= false;



  @override
  Widget build(BuildContext context)  {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
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
                controller: _namecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Ad Soyad",
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: 385.0,
              child: TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  hintText: "E-posta"
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: 385.0,
              child: TextField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Parola",
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                     Container(
                      width: 385.0,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () async{
                          await auth.createUserWithEmailAndPassword(
                              email: _emailcontroller.text,
                              password: _passwordcontroller.text,

                          ).then((value){
                            FirebaseFirestore.instance.collection('User').doc(value.user?.uid).set({"email":value.user?.email, "name": _namecontroller.text});
                            FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).update({"Name": _namecontroller.text,"Gender": "-","Age":"-","Blood Type": "-","Time": "-","City":"-",'Phone Number': "-"});
                            FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).update({"Gender": "-", "Age": "-", "Time": "-", "Kg": "-" , "Stp": "-","disease": "-"});
                            FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).update({"Can Donated":'false'});
                            FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).update({'Profile Foto':'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'});
                            FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).update({"Kan Arama":requestBlood});
    FirebaseFirestore.instance
        .collection('ReqBloodAge')
        .doc(auth.currentUser?.uid)
        .update({

    "-": "-",

    });
    FirebaseFirestore.instance
        .collection('ReqBloodCity')
        .doc(auth.currentUser?.uid)
        .update({
    "-": "-"
    });
    FirebaseFirestore.instance
        .collection('ReqBloodName')
        .doc(auth.currentUser?.uid)
        .update({
    "-": "-"
    });
    FirebaseFirestore.instance
        .collection('ReqBloodType')
        .doc(auth.currentUser?.uid)
        .update({
    "-": "-"
    });
    Navigator.of(context).pop();
    },
                          );
                          Navigator.push(context, MaterialPageRoute(builder:  (context) => MainPage()));

                        },
                      child: Text("Kayıt Ol",  style: TextStyle(fontSize: 16)),
                      ),
                      )
              ],
            ),
          ],
        ),
        ),
    );
  }



}
