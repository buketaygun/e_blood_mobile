import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood/ProfileDetails.dart';
import 'package:e_blood/SettingsPage.dart';
import 'package:e_blood/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'MainPage.dart';
import 'SliderMenu.dart';


class showProfileInfo extends StatefulWidget {
  const showProfileInfo({super.key});

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
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profil",
            style: TextStyle(
                color: Colors.black,fontSize:15,fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
          Center(
            child: Container(
              width: 360,
              height: 580,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)), color: Colors.white ),
              child: SingleChildScrollView(
                child: FutureBuilder<DocumentSnapshot>(
                  future: usersCollection.doc(auth.currentUser?.uid).get(),
                  builder: (ctx, streamSnapshot) {
                    if (!streamSnapshot.hasData) {
                      print("Henüz bilgilerinizi girmediniz");
                    }
                    if (streamSnapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          streamSnapshot.data!.data() as Map<String, dynamic>;

                      canDonatedM = "${data['Can Donated']}";

                      bool isDonated33 = isDonated(canDonatedM, isDonatedd);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const Padding(padding: EdgeInsets.all(20)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 350,
                                    height: 145,
                                    child:Expanded(
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(300, 0, 2, 0),
                                              child: Transform.scale(
                                                scale: 0.8,
                                                child: IconButton(
                                                    iconSize: 45.0,
                                                    onPressed: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> profilePage()));
                                                    },
                                                    icon: Image.asset("assets/images/edit profile.png"
                                                    ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: FutureBuilder<DocumentSnapshot>(
                                                future:
                                                usersCollection.doc(auth.currentUser?.uid).get(),
                                                builder: (ctx, streamSnapshot) {
                                                  if (!streamSnapshot.hasData) {
                                                    print("Henüz bilgilerinizi girmediniz");
                                                  }
                                                  if (streamSnapshot.connectionState ==
                                                      ConnectionState.done) {
                                                    Map<String, dynamic> data = streamSnapshot.data!
                                                        .data() as Map<String, dynamic>;
                                                    return Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Center(
                                                                child: CircleAvatar(
                                                                  radius: 35,
                                                                  backgroundColor: Colors.red[200],
                                                                  backgroundImage: NetworkImage(
                                                                      data['Profile Foto']),
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(50)),
                                                                    width: 85,
                                                                    height: 85,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                        ]);
                                                  }
                                                  return const Text('Yükleniyor');
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,
                                ),
                                width: 344,
                                height: 47,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("  "+
                                      " ${data['Name']} ",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                ),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.all(0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(padding: EdgeInsets.symmetric(vertical: 35,horizontal: 0)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,
                                ),
                                width: 344,
                                height: 47,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("   "+
                                      "${data['Age']} ",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),

                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(padding: EdgeInsets.symmetric(vertical: 25,horizontal: 0)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,
                                ),
                                width: 344,
                                height: 47,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("  "+
                                      "${data['Gender']} ",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),

                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(padding: EdgeInsets.symmetric(vertical: 35,horizontal: 0)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,
                                ),
                                width: 344,
                                height: 47,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("  "+
                                      "${data['City']} ",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(padding: EdgeInsets.symmetric(vertical: 25,horizontal: 0)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,
                                ),
                                width: 344,
                                height: 47,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("  "+
                                      "${data['Blood Type']} ",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),

                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(padding: EdgeInsets.symmetric(vertical: 35,horizontal: 0)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,
                                ),
                                width: 344,
                                height: 47,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("  "+
                                      "${data['Phone Number']} ",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),

                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,
                                ),
                                width: 344,
                                height: 47,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Row(
                                    children: [
                                      IconButton(
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
                                      Padding(padding: EdgeInsets.fromLTRB(200, 0, 0, 0)),
                                      Text("Kan verebilir", style: TextStyle(fontSize: 16, color: Colors.black),),
                                    ],
                                  ),
                              ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return const Text('Yükleniyor');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: "",
              icon: IconButton(
                icon: const ImageIcon(
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
              icon: const ImageIcon(
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
                  icon: const ImageIcon(
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

  var listLanguage = ['Türkçe', 'İngilizce'];
  String dropDownValLang = 'Türkçe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profil",
            style: TextStyle(
              color: Colors.black,fontSize:15,fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
                  width: 350,
                  height: 170,
                  child:Expanded(
                    child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(backgroundColor: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => showProfileInfo()));
                          },
                            child: Column(
                              children: [
                                IconButton(
                                  iconSize: 42.0,
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> profilePage()));
                                    },
                                    icon: const IconTheme(
                                      data: IconThemeData(
                                        color: Colors.redAccent,
                                      ),
                                      child: Align(
                                        alignment: Alignment(16.5,0),
                                        child: ImageIcon(
                                          AssetImage("assets/images/edit profile.png"),
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(
                                  child: FutureBuilder<DocumentSnapshot>(
                                    future:
                                        usersCollection.doc(auth.currentUser?.uid).get(),
                                    builder: (ctx, streamSnapshot) {
                                      if (!streamSnapshot.hasData) {
                                        print("Henüz bilgilerinizi girmediniz");
                                      }
                                      if (streamSnapshot.connectionState ==
                                          ConnectionState.done) {
                                        Map<String, dynamic> data = streamSnapshot.data!
                                            .data() as Map<String, dynamic>;
                                        return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Padding(padding: EdgeInsets.all(0)),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: CircleAvatar(
                                                      radius: 35,
                                                      backgroundColor: Colors.red[200],
                                                      backgroundImage: NetworkImage(
                                                          data['Profile Foto']),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(50)),
                                                        width: 85,
                                                        height: 85,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(0, 0, 0, 30)),
                                                  Text(
                                                    " ${data['Name']} ",
                                                    style: const TextStyle(
                                                        fontSize: 14, color: Colors.black),
                                                  ),
                                                  const Padding(
                                                      padding: EdgeInsets.all(15)),
                                                ],
                                              ),
                                            ]);
                                      }
                                      return const Text('Yükleniyor');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                      ),
              ],
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
            SizedBox(
              width: 390,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                icon: const IconTheme(
                  data: IconThemeData(
                    color: Colors.black,
                  ),
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/Blood Bag.png",
                    ),
                  ),
                ),
                label: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Bağışlarım',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0)),
            SizedBox(
              width: 390,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                icon: const IconTheme(
                  data: IconThemeData(
                    color: Colors.black,
                  ),
                  child: ImageIcon(
                    AssetImage("assets/images/Megaphone.png"),
                  ),
                ),
                label: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bildirim Ayarları',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    )),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0)),
            SizedBox(
              width: 390,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileDetails()));
                },
                icon: const IconTheme(
                  data: IconThemeData(
                    color: Colors.black,
                  ),
                  child: ImageIcon(
                    AssetImage("assets/images/Group 74.png"),
                  ),
                ),
                label: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kan Bağışı Nedir?',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    )),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0)),
            SizedBox(
              width: 390,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                icon: const IconTheme(
                  data: IconThemeData(
                    color: Colors.black,
                  ),
                  child: ImageIcon(
                    AssetImage("assets/images/Chat.png"),
                  ),
                ),
                label: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bize Ulaşın',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    )),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0)),
            SizedBox(
              width: 390,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage()));
                },
                icon: const IconTheme(
                  data: IconThemeData(
                    color: Colors.black,
                  ),
                  child: ImageIcon(
                    AssetImage("assets/images/Settings.png"),
                  ),
                ),
                label: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ayarlar',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    )),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
            SizedBox(
              width: 390,
              height: 47,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                child: Row(
                  children: [
                    const Text(
                      "Dil",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 132),
                    ),
                    DropdownButton(
                      value: dropDownValLang,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listLanguage.map((String list) {
                        return DropdownMenuItem(
                          value: list,
                          child: Text(
                            list,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? val) {
                        setState(() {
                          dropDownValLang = val!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0)),
            SizedBox(
              width: 390,
              height: 47,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  label: Align(
                      alignment: Alignment.centerLeft,
                      child: const Text('Çıkış Yap',
                          style: TextStyle(color: Colors.black))),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    signOut();
                  },
                  icon: const IconTheme(
                    data: IconThemeData(
                      color: Colors.black,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ImageIcon(
                        AssetImage("assets/images/Vector 334.png"),
                      ),
                    ),
                  ),
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
              icon: const ImageIcon(
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
                  icon: const ImageIcon(
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

  signOut() async{
    var _user=GoogleSignIn().currentUser;
    if(_user!=null){
      await GoogleSignIn().disconnect();}
    await auth.signOut();

  }


}
