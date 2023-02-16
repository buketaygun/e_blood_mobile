
import 'package:e_blood/SliderMenu.dart';

import 'package:e_blood/verifyPhoneNumber.dart';

import 'package:flutter/material.dart';
import 'package:e_blood/showProfileInfo.dart';


class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("asa"),
      ),
      body:Column(
        children:  [
            Center(
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:  (context) => const verifyPhoneNumber()));
                  },
                  child: Text("num")
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
                AssetImage(
                    "assets/images/UI Menu.png",
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
                          builder: (context) => mainProfile()));
                }
              )
          ),

        ],

      ),
    );
    }
}

