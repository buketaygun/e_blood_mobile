import 'package:flutter/material.dart';

class ProfileDetails extends StatefulWidget{
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kan Bağışı Nedir?",
            style: TextStyle(
                color: Colors.black,fontSize:15,fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
                  Image(
                      image: AssetImage(
                          "assets/images/Group 75.png"
                      ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 13.0)),
                  Container(
                    width: 344,
                    child: Text(
                      "Akronat. Relig vust. Sysamma stenolingar. Krotede. Fasade apopp. Oling antining. Poregt. Reageren.Lartad. Kroren vimäv. Exoment kroninat. In iskap.Lapost bepossade. Tett. Dill decilingar. Pseudogör  \n plar. \n  Konnetik. Detregisk. Ägt demiosmos. Mädat gämäd.Gigade. Decidelogi tiren. Mänar prer. Syr ahet.",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
