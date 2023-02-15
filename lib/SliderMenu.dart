import 'package:e_blood/showProfileInfo.dart';
import 'package:flutter/material.dart';
import 'MainPage.dart';



class SliderMenu extends StatefulWidget{
  @override
  State<SliderMenu> createState() => _SliderMenuState();
}

class _SliderMenuState extends State<SliderMenu> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            builder: (context) => mainProfile()));
                  }
              )
          ),

        ],

      ),
    );
  }
}