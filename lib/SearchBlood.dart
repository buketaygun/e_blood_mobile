import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood/showProfileInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';

class SearchBlood extends StatefulWidget{
  const SearchBlood({super.key});

  @override
  State<SearchBlood> createState() => _SearchBloodState();
}

class _SearchBloodState extends State<SearchBlood> {

  String name= "";
  String age="";
  String bloodType="";
  String phoneNumber="";
  String unitAmount="";
  String city="";
  String notes="";

  bool requestBlood= true;

  FirebaseAuth auth=FirebaseAuth.instance;

  int personSearchBlood=2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kan Arama",
            style: TextStyle(
                color: Colors.black,fontSize:15,fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0)),
            Center(
              child: Container(
            width: 360,
    height: 550,
    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0)), color: Colors.white ),
    child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(15)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,
                ),
                width: 344,
                height: 50,
                child: TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: const InputDecoration(
                    labelText: '   Ad-Soyad',
                    border: InputBorder.none,
                  ),
                ),
              ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100],
              ),
              width: 344,
              height: 50,
              child: TextField(
                onChanged: (value){
                  age= value;
                },
                decoration: const InputDecoration(
                  labelText: '   Yaş',
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100],
              ),
              width: 344,
              height: 50,
              child: TextField(
                onChanged: (value){
                  bloodType=value;
                },
                decoration: const InputDecoration(
                  labelText: '   Kan Grubu',
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100],
              ),
              width: 344,
              height: 50,
              child: TextField(
                onChanged: (value){
                  phoneNumber=value;
                },
                decoration: const InputDecoration(
                  labelText: '   İletişim',
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100],
              ),
              width: 344,
              height: 50,
              child: TextField(
                onChanged: (value){
                  unitAmount=value;
                },
                decoration: const InputDecoration(
                  labelText: '   Ünite İhtiyacı',
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100],
              ),
              width: 344,
              height: 50,
              child: TextField(
                onChanged:(value) {
                  city=value;
                },
                decoration: const InputDecoration(
                  labelText: '   İl',
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100],
              ),
              width: 344,
              height: 130,
              child: TextField(
                onChanged: (value){
                  notes=value;
                },
                decoration: const InputDecoration(
                  labelText: '   Not',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
    ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0)),
            Container(
              width: 344,
              height: 47,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400]),
                  onPressed:(){
                  personSearchBlood++;
                   FirebaseFirestore.instance
                        .collection('ReqBloodAge')
                        .doc(auth.currentUser?.uid)
                        .update({

                      "Age": age,

                    });
                   FirebaseFirestore.instance
                       .collection('ReqBloodCity')
                       .doc(auth.currentUser?.uid)
                       .update({
                     "City": city
                   });
                   FirebaseFirestore.instance
                       .collection('ReqBloodName')
                       .doc(auth.currentUser?.uid)
                       .update({
                     "Name": name
                   });
                   FirebaseFirestore.instance
                       .collection('ReqBloodType')
                       .doc(auth.currentUser?.uid)
                       .update({
                     "Blood Type": bloodType
                   });
                   FirebaseFirestore.instance
                       .collection('ReqBloodUnit')
                       .doc(auth.currentUser?.uid)
                       .update({
                     "Unit": unitAmount
                   });
                  FirebaseFirestore.instance
                      .collection('personSearchBlood')
                      .doc("dwDnNx0ybw89WoNmflcX")
                      .update({
                    "person": personSearchBlood
                  });
                   Navigator.of(context).pop();
                  },
                  child: Text(
                    'Kaydet'
                  ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: "",
              icon: IconButton(
                icon: const ImageIcon(
                  AssetImage(
                    "assets/images/UI Menu.png",
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPage()));
                },
              )
          ),
          BottomNavigationBarItem(
            label: "",
            icon: IconButton(
              color: Colors.red.shade900,
              icon:const ImageIcon(
                AssetImage(
                  "assets/images/Blood Drop.png",

                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchBlood()));
              },
            ),
          ),
          BottomNavigationBarItem(
              label: "",
              icon: IconButton(
                  icon: const ImageIcon(
                    AssetImage("assets/images/Person.png"),

                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => mainProfile()));
                  }
              )
          ),

        ],

      ),
    );
  }
}