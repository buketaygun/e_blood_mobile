import 'package:e_blood/showProfileInfo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'MainPage.dart';
import 'SliderMenu.dart';

class CanDonatedPage extends StatefulWidget{
  const CanDonatedPage({super.key});

  @override
  State<CanDonatedPage> createState() => _CanDonatedPageState();
}

class _CanDonatedPageState extends State<CanDonatedPage> {

  final auth=FirebaseAuth.instance;
  final firestore= FirebaseFirestore.instance;


  late bool canDonate;


  var ageList=['0-17','18-65','+66'];
  var monthsList= ['Hiç','1','2','3','4','5','6','7','8','9','10','11','12','12+'];
  var genderList= ['Kadın', 'Erkek'];
  var kgList=['25-49','50-99','100-150',
  ];
  var surgeryTattooPiercingList= ['Hayır','Evet'];
  var contagiousDiseaseList=['Evet','Hayır'];

  late String ageVal='0-17';
  late String stpVal='Hayır';
  late String kgVal='25-49';
  late String genderVal='Kadın';
  late String diseaseVal='Evet';
  late String monthsVal='Hiç';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Kan Bağışına Uygunluk", style: TextStyle(color: Colors.black54),),
        backgroundColor: Colors.white,
      ) ,
      body:Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
          Center(
            child: Container(
              width: 360,
              height: 450,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0)), color: Colors.white ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(padding:EdgeInsets.all(15) ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,),
                      width: 344,
                      height: 47,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            DropdownButton(
                                  value: genderVal,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: genderList.map((String list) {
                                    return DropdownMenuItem(
                                      value: list,
                                      child:Text("    "+list+ "     "),
                                    );
                                  },).toList(),
                                  onChanged: (String? val){
                                    setState(() {
                                      genderVal=val!;
                                    });
                                  }
                              ),
                            const Padding(padding: EdgeInsets.fromLTRB(110, 0, 2, 0)),
                            const Text('Cinsiyetinizi Seçiniz',
                              style: TextStyle(fontSize: 13.0, color: Colors.black54),),
                            ],),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,),
                      width: 344,
                      height: 47,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                                DropdownButton(
                                  value: ageVal,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: ageList.map((String list) {
                                    return DropdownMenuItem(
                                      value: list ,
                                      child: Text("     "+list+"    "),
                                    );
                                  } ).toList(),
                                  onChanged:(String? val) {
                                    setState(() {
                                      ageVal=val!;
                                    });
                                  }
                              ),
                            const Padding(padding: EdgeInsets.fromLTRB(112, 0, 2, 0)),
                            const Text('       Yaşınızı Seçiniz',
                              style: TextStyle(fontSize: 13.0, color: Colors.black54),),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,),
                      width: 344,
                      height: 47,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [

                            DropdownButton(
                                    value: monthsVal,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: monthsList.map(( String list) {
                                      return DropdownMenuItem(
                                        value: list,
                                        child: Text("       "+list+"     "),
                                      );
                                    }).toList(),
                                    onChanged: (String? val){
                                      setState(() {
                                        monthsVal=val!;
                                      });
                                    }
                              ),
                            Padding(padding: EdgeInsets.fromLTRB(48, 0, 0, 0)),
                            Text(
                              ' En son kaç ay önce kan bağışı \n ?  yaptınız ',
                              style: TextStyle(fontSize: 13.0, color: Colors.black54),textAlign:TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,),
                      width: 344,
                      height: 47,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            DropdownButton(
                                  value: kgVal,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: kgList.map(( String list) {
                                    return DropdownMenuItem(
                                      value: list,
                                      child: Text("   "+list+ " "),
                                    );
                                  }).toList(),
                                  onChanged: (String? val){
                                    setState(() {
                                      kgVal=val!;
                                    });
                                  }
                              ),
                            Padding(padding: EdgeInsets.fromLTRB(137, 0, 0, 0)),
                            Text(
                              'Kilonuzu seçiniz ',
                              style: TextStyle(fontSize: 13.0, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,),
                      width: 344,
                      height: 47,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                               DropdownButton(
                                      value: stpVal,
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      items: surgeryTattooPiercingList.map(( String list) {
                                        return DropdownMenuItem(
                                          value: list,
                                          child: Text("     "+ list+ "     "),
                                        );
                                      }).toList(),
                                      onChanged: (String? val){
                                        setState(() {
                                          stpVal=val!;
                                        });
                                      }
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(55, 0, 0, 0)),
                            Text(
                              '   Son 1 yıl içinde hiç ameliyat \n   olmadım, dövme ve piercing \n   .yaptırmadım',
                              style: TextStyle(fontSize: 13.0,color: Colors.black54),textAlign:TextAlign.left,
                            ),

                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)), color: Colors.grey[100] ,),
                      width: 344,
                      height: 47,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            DropdownButton(
                                  value: diseaseVal,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: contagiousDiseaseList.map(( String list) {
                                    return DropdownMenuItem(
                                      value: list,
                                      child: Text("      "+list+ "   "),
                                    );
                                  }).toList(),
                                  onChanged: (String? val){
                                    setState(() {
                                      diseaseVal=val!;
                                    });
                                  }
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(90, 0, 0, 0)),
                            Text(
                              '   .Bulaşıcı hastalığım yok',
                              style: TextStyle(fontSize: 13.0, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(30)),
          Container(
            width: 344,
            height: 47,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: (){
                  FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).update({"Gender": genderVal, "Age": ageVal, "Time": monthsVal, "Kg": kgVal, "Stp": stpVal,"disease": diseaseVal});
                  donatedCond();
                  Navigator.of(context).pop();

                },
                child: const Text("Sorgula", style: TextStyle(color: Colors.white),)
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: "",
              icon: IconButton(
                icon: ImageIcon(
                  AssetImage(
                      "assets/images/UI Menu.png"
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SliderMenu()));
                },
              )
          ),
          BottomNavigationBarItem(
            label: "",
            icon: IconButton(
              color: Colors.red.shade900,
              icon:ImageIcon(
                AssetImage(
                  "assets/images/Blood Drop.png",

                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPage()));
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
                  }
              )
          ),
        ],
      ),
    );
  }

   void donatedCond(){
    if(genderVal=='Kadın'){
      if(monthsVal=="1" || monthsVal=="2" || monthsVal=='3' || monthsVal=='4'||
          stpVal == 'Hayır' || kgVal == '25-49' || kgVal == '100-150' ||
          diseaseVal == 'Hayır' || ageVal == '0-17' || ageVal == '+66'){
        Fluttertoast.showToast(msg: 'Kan veremezsiniz',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0
        );
        canDonate=false;
        FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).update({"Can Donated": canDonate});

      }
      else{
        Fluttertoast.showToast(msg: 'Kan verebilirsiniz',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
        canDonate=true;
        FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).update({"Can Donated": canDonate});
      }
      }
    else if(genderVal=='Erkek') {
      if (monthsVal == "1" || monthsVal == "2" || monthsVal == '3' ||
          stpVal == 'Hayır' || kgVal == '25-49' || kgVal == '100-150' ||
          diseaseVal == 'Hayır' || ageVal == '0-17' || ageVal == '+66') {
        Fluttertoast.showToast(msg: 'Kan veremezsiniz',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0
        );
        canDonate=false;
        FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).update({"Can Donated": canDonate.toString()});

      }
      else {
        Fluttertoast.showToast(msg: 'Kan verebilirsiniz',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13.0);
        canDonate=true;
        FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).update({"Can Donated": canDonate.toString()});
      }
    }
    else {
      Fluttertoast.showToast(
          msg: 'Cinsiyet kısmı boş bırakılamaz.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13.0);
    }
   }



}