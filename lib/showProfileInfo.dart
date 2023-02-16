import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              }
              if (streamSnapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    streamSnapshot.data!.data() as Map<String, dynamic>;

                canDonatedM = "${data['Can Donated']}";

                bool isDonated33 = isDonated(canDonatedM, isDonatedd);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.all(20)),
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
                    const Padding(padding: EdgeInsets.all(15)),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: const Text("Ad Soyad :",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        const Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        SizedBox(
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
                    const Padding(padding: EdgeInsets.all(0)),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: const Text("Yaş :",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        const Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        SizedBox(
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
                    const Padding(padding: EdgeInsets.all(0)),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: const Text("Cinsiyet :",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        const Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        SizedBox(
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
                    const Padding(padding: EdgeInsets.all(0)),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: const Text("Şehir :",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        const Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        SizedBox(
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
                    const Padding(padding: EdgeInsets.all(0)),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: const Text("Kan Grubu :",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        const Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        SizedBox(
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
                    const Padding(padding: EdgeInsets.all(3)),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: const Text(
                                  "En son kaç ay \nönce kan verdiniz ? :",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        const Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        SizedBox(
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
                    const Padding(padding: EdgeInsets.all(6)),
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          height: 48.5,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: const Text("Kan verebilir  mi ? :",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54))),
                        ),
                        const Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
                        SizedBox(
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
                    const Padding(padding: EdgeInsets.all(10)),
                    SizedBox(
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
                SizedBox(
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
                                                      radius: 37,
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
              width: 350,
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
              width: 350,
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
              width: 350,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
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
              width: 350,
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
              width: 350,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
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
                  onPressed: () {},
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
}
