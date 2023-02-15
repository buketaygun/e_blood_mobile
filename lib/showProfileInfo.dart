import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'MainPage.dart';
import 'SliderMenu.dart';

class showProfileInfo extends StatefulWidget {
  @override
  State<showProfileInfo> createState() => _showProfileInfoState();
}

class _showProfileInfoState extends State<showProfileInfo> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('User');

  late String canDonatedM;

  bool isDonatedd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profil",
            style: TextStyle(
              color: Colors.black54,
            ),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder<DocumentSnapshot>(
            future: usersCollection.doc(auth.currentUser?.uid).get(),
            builder: (ctx, streamSnapshot) {
              if (!streamSnapshot.hasData) {
                print("Henüz bilgilerinizi girmediniz");
                Fluttertoast.showToast(
                    msg: 'Henüz bilgilerinizi girmediniz.',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 13.0);
              }
              if (streamSnapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    streamSnapshot.data!.data() as Map<String, dynamic>;

                canDonatedM = "${data['Can Donated']}";

                bool isDonated33 = isDonated(canDonatedM, isDonatedd);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.all(20)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.red[200],
                            backgroundImage: NetworkImage(data['Profile Foto']),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              width: 85,
                              height: 85,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    Row(
                      children: [
                        Container(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text("Ad Soyad :",
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        Container(
                          width: 175,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Text(
                              " ${data['Name']} ",
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(0)),
                    Row(
                      children: [
                        Container(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text("Yaş :",
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        Container(
                          width: 175,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Text(
                              "${data['Age']} ",
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(0)),
                    Row(
                      children: [
                        Container(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text("Cinsiyet :",
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        Container(
                          width: 175,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Text(
                              "${data['Gender']} ",
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(0)),
                    Row(
                      children: [
                        Container(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text("Şehir :",
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        Container(
                          width: 175,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Text(
                              "${data['City']} ",
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(0)),
                    Row(
                      children: [
                        Container(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text("Kan Grubu :",
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        Container(
                          width: 175,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Text(
                              "${data['Blood Type']} ",
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(3)),
                    Row(
                      children: [
                        Container(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text(
                                  "En son kaç ay \nönce kan verdiniz ? :",
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        Container(
                          width: 175,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Text(
                              "${data['Time']} ",
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(6)),
                    Row(
                      children: [
                        Container(
                          width: 175,
                          height: 48.5,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text("Kan verebilir  mi ? :",
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        Container(
                          width: 175,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: IconButton(
                              onPressed: () {},
                              icon: isDonated33
                                  ? const Icon(
                                      Icons.check_box,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.check_box,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Container(
                      width: 385.0,
                      height: 60.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profilePage()));
                        },
                        child: const Text("Profil bilgilerini değiştir"),
                      ),
                    ),
                  ],
                );
              }
              return const Text('Yükleniyor');
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: "",
              icon: IconButton(
                icon: ImageIcon(
                  AssetImage("assets/images/UI Menu.png"),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SliderMenu()));
                },
              )),
          BottomNavigationBarItem(
            label: "",
            icon: IconButton(
              color: Colors.red.shade900,
              icon: ImageIcon(
                AssetImage(
                  "assets/images/Blood Drop.png",
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
          ),
          BottomNavigationBarItem(
              label: "",
              icon: IconButton(
                  icon: ImageIcon(
                    AssetImage("assets/images/Person.png"),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => mainProfile()));
                  })),
        ],
      ),
    );
  }

  bool isDonated(String canDonated, bool isDonate) {
    if (canDonated == 'true') {
      isDonate = true;
    } else if (canDonated == 'false') {
      isDonate = false;
    }
    return isDonate;
  }
}

class mainProfile extends StatefulWidget {
  @override
  State<mainProfile> createState() => _mainProfileState();
}

class _mainProfileState extends State<mainProfile> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profil",
            style: TextStyle(
              color: Colors.black54,
            ),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  height: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> showProfileInfo()));
                      },
                    child: Container(
                      //color: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: FutureBuilder<DocumentSnapshot>(
                        future: usersCollection.doc(auth.currentUser?.uid).get(),
                        builder: (ctx, streamSnapshot) {
                          if (!streamSnapshot.hasData) {
                            print("Henüz bilgilerinizi girmediniz");

                          }
                          if (streamSnapshot.connectionState == ConnectionState.done) {
                            Map<String, dynamic> data =
                                streamSnapshot.data!.data() as Map<String, dynamic>;
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.all(20)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: CircleAvatar(
                                          radius: 45,
                                          backgroundColor: Colors.red[200],
                                          backgroundImage:
                                              NetworkImage(data['Profile Foto']),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50)),
                                            width: 85,
                                            height: 85,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(padding: EdgeInsets.fromLTRB(0,0,0, 40)),
                                      Container(
                                          child: Text(
                                            " ${data['Name']} ",
                                            style: const TextStyle(
                                                fontSize: 14, color: Colors.black),
                                          ),
                                        ),
                                      Padding(padding: EdgeInsets.all(15)),

                                    ],
                                  ),
                                ]);
                          }
                          return const Text('Yükleniyor');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
            Container(
              width: ,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed:(){},
                  child: Text(""),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: (){},
                child: Text(""),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: (){},
                child: Text(""),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: (){},
                child: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
