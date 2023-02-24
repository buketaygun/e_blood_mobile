import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget{
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: const Text("Ayarlar",
            style: TextStyle(
                color: Colors.black,fontSize:15,fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
      ) ,
      body: Column(
       children: [
         const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
         Row(
           children: [
             Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
             Container(
               width: 290,
                 //height: 50,
                 child: Text("Parola Değiştir", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400 ),)),
             IconButton(
                 onPressed:(){},
                 icon: ImageIcon(
                   AssetImage("assets/images/Vector 334.png"),
                 )
             ),
           ],
         ),
         Row(
           children: [
             Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
             Container(
                 width: 290,
                 //height: 50,
                 child: Text("Gizlilik Ayarları", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400 ),)),
             IconButton(
                 onPressed:(){},
                 icon: ImageIcon(
                   AssetImage("assets/images/Vector 334.png"),
                 )
             ),
           ],
         ),
       ],
      ),
    );
  }
}
