import 'package:e_blood/SliderMenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_blood/showProfileInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final FirebaseAuth auth=FirebaseAuth.instance;

  final db= FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    CollectionReference reqBlood= db.collection("ReqBlood");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: reqBlood.snapshots(),
                builder: (context, AsyncSnapshot asyncSnapshot){
                List<DocumentSnapshot> listData= asyncSnapshot.data.docs;
                return Flexible(
                  child: ListView.builder(
                    itemCount: listData.length,
                      itemBuilder: (context, index){
                      return Text('${listData[index].data()?['Name']}');
                      },
                  ),
                );
                }
            ),

        ],
      ),
























      /*body:Column(
        children: [
          SingleChildScrollView(
            child : FutureBuilder<QuerySnapshot>(
              future:reqBlood.get() ,
              builder: (context, AsyncSnapshot asyncSnapshot){
              if (asyncSnapshot.connectionState ==
              ConnectionState.done) {
              List<DocumentSnapshot> data = asyncSnapshot.data.docs;
              return Flexible(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                     return Column(
                        children: [
                          Container(
                            width: 400,
                            height: 210,
                            decoration:  BoxDecoration(
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)) ,color: Colors.red[600],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                          Container(
                            color: Colors.white,
                            width: 320,
                            height: 150,
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(20, 15, 0, 0)),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)), color:  Colors.pink[50]
                                  ),
                                  width:115,
                                  height: 120,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 115,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)), color: Colors.red[600]
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(vertical:32),
                                          child: Text( "${data[index].data()}", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),)
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(left: 15, top: 20),
                                            child:Text("")
                                          // Text(" ${data['Name']} ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20, left: 83),
                                          child: Transform.scale(
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              child: IconButton(
                                                icon: ImageIcon(
                                                  AssetImage(
                                                      "assets/images/Rectangle 23.png"
                                                  ),
                                                ),
                                                onPressed: (){

                                                },
                                              ),
                                            ),
                                            scale: 1.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(left: 17, top: 4),
                                            child: Text("")
                                          //Text(" ${data['Age']} "+ "yaşında",style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal),),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(left: 15, top: 4),
                                            child:Text("")
                                          //Text(" ${data['City']} ",style: TextStyle(fontSize: 8, fontWeight: FontWeight.normal),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 35, left: 20),
                                          child: SizedBox(
                                            width: 120,
                                            height:30,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400], ),
                                              onPressed: (){},
                                              child:Text('Destek Ol',
                                                  style: TextStyle(fontSize: 11)),

                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 10, top: 35),
                                          child: Container(
                                            color: Colors.pink[50],
                                            width: 25,
                                            height: 25,
                                            child: IconButton(
                                              onPressed: (){
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
                                              },
                                              icon: ImageIcon(
                                                AssetImage(
                                                    "assets/images/Vector-3.png"
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                    );
                  },

                ),
              );
  }
              return Text("hey");
              },
            ),
            ),
        ]
          ),*/
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
                  icon:const ImageIcon(
                    AssetImage(
                      "assets/images/Blood Drop.png",

                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()));
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

