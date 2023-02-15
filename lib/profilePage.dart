import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood/CanDonatedPage.dart';
import 'package:e_blood/MainPage.dart';
import 'package:e_blood/showProfileInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'SliderMenu.dart';

class profilePage extends StatefulWidget {
  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  String name="";
  late String gender, age, bloodType;
  String city="";
  String mobilePhone="";
  late int lastGivenTime;
  bool showState = false;
  var listGender = ['kadın', 'erkek'];
  String dropdownvalGender = 'kadın';
  var listAge = [
    '18',
    '19',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59'
  ];
  String dropdownValAge = "18";
  var listBloodType = ['AB+', 'AB-', 'A+', 'A-', 'B+', 'B-', '0+', '0-'];
  String drowdownValBlood = 'AB+';
  var months = [
    '-',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '12+'
  ];
  String dropDownValMonths = '-';
  FirebaseAuth auth = FirebaseAuth.instance;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  File? _photo;

  final ImagePicker _picker = ImagePicker();

  FirebaseFirestore cloud = FirebaseFirestore.instance;


  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('Fotoğraf seçilmedi..');
      }
    });
  }

  Future imgFromCam() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('Fotoğraf seçilmedi..');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'User/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      final store = ref.putFile(_photo!);
      final snapshot = await store.whenComplete(() {});

      final urlDownload = await snapshot.ref.getDownloadURL();

      FirebaseFirestore.instance
          .collection('User')
          .doc(auth.currentUser?.uid)
          .update({"Profile Foto": urlDownload});
    } catch (e) {
      print('Hata..');
    }
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Galeri'),
                  onTap: () {
                    imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Kamera'),
                  onTap: () {
                    imgFromCam();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ));
        });
  }

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
            Padding(padding: EdgeInsets.all(12)),
            GestureDetector(
              onTap: () {
                showPicker(context);
              },
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.red[200],
                child: _photo != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.file(
                          _photo!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 85,
                        height: 85,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.red,
                        )),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 385.0,
              child: TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  labelText: 'Ad-Soyad',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              width: 385.0,
              child: TextField(
                onChanged: (value) {
                  city = value;
                },
                decoration: InputDecoration(
                  labelText: 'Nerede Yaşıyorsunuz ?',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              width: 385.0,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  mobilePhone = value;
                },
                decoration: InputDecoration(
                  labelText: 'Telefon Numarası ?',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: (){},
                    child: Text(
                      '   Cinsiyetinizi Seçiniz',
                      style: TextStyle(fontSize: 15.0, color: Colors.black54),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(108, 5, 0, 5)),
                DropdownButton(
                    value: dropdownvalGender,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listGender.map(
                      (String list) {
                        return DropdownMenuItem(
                          value: list,
                          child: Text(list),
                        );
                      },
                    ).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        dropdownvalGender = val!;
                      });
                    }),
              ],
            ),
            Padding(padding: EdgeInsets.all(3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: (){},
                    child: Text(
                      '   Yaşınızı Seçiniz',
                      style: TextStyle(fontSize: 15.0, color: Colors.black54),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(128, 5, 0, 5)),
                DropdownButton(
                    value: dropdownValAge,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listAge.map((String list) {
                      return DropdownMenuItem(
                        value: list,
                        child: Text(list),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        dropdownValAge = val!;
                      });
                    }),
              ],
            ),
            Padding(padding: EdgeInsets.all(3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: (){},
                    child: Text(
                      '   Kan grubunuzu seçiniz',
                      style: TextStyle(fontSize: 15.0, color: Colors.black54),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(116, 5, 0, 5)),
                DropdownButton(
                    value: drowdownValBlood,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    items: listBloodType.map((String list) {
                      return DropdownMenuItem(
                        value: list,
                        child: Text(list),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        drowdownValBlood = val!;
                      });
                    }),
              ],
            ),
            Padding(padding: EdgeInsets.all(3)),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: (){},
                    child: Text(
                      '   En son kaç ay önce kan \n   bağışı yaptınız ?',
                      style: TextStyle(fontSize: 15.0, color: Colors.black54),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(117, 5, 0, 5)),
                DropdownButton(
                    value: dropDownValMonths,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: months.map((String list) {
                      return DropdownMenuItem(
                        value: list,
                        child: Text(list),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        dropDownValMonths = val!;
                      });
                    }),
              ],
            ),
            Padding(padding: EdgeInsets.all(3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 185.5,
                  height: 60.0,
                  child: TextButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CanDonatedPage()));
                    },
                    child: Text(
                      "Kan bağışı yapabilir miyim ?",
                      style: TextStyle(color: Colors.white, fontSize: 14,),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(3)),
                Container(
                  width: 185.5,
                  height: 60.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('User')
                            .doc(auth.currentUser?.uid)
                            .update({
                          "Name": name,
                          "Gender": dropdownvalGender,
                          "Age": dropdownValAge,
                          "Blood Type": drowdownValBlood,
                          "Time": dropDownValMonths,
                          "City": city,
                          'Phone Number': mobilePhone
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Kaydet",
                      style: TextStyle(fontSize: 14)
                        ,)),
                ),
              ],
            ),
          ],
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => showProfileInfo()));
                  })),
        ],
      ),
    );
  }
}
