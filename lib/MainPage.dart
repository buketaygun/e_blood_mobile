import 'package:e_blood/SearchBlood.dart';
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
    CollectionReference reqBlood= db.collection("ReqBloodName");
    CollectionReference reqBlood1=db.collection("ReqBloodAge");
    CollectionReference reqBlood2= db.collection("ReqBloodCity");
    CollectionReference reqBlood3= db.collection("ReqBloodType");
    CollectionReference searchBlood=db.collection("personSearchBlood");
    CollectionReference canDonate= db.collection("personCanDonated");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            width: 400,
            height: 210,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)) ,color: Colors.red[600],
            ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: FutureBuilder<DocumentSnapshot>(
                  future: canDonate.doc("mKf65HUj513JNqaKwi0w").get(),
               builder: (context, streamSnapshot1) {
                 if (!streamSnapshot1.hasData) {
                   return Center(child: CircularProgressIndicator());
                 }
                 if (streamSnapshot1.connectionState ==
                     ConnectionState.done) {
                   Map<String, dynamic> data1 =
                   streamSnapshot1.data!.data() as Map<String, dynamic>;
                   return FutureBuilder<DocumentSnapshot>(
                       future: searchBlood.doc("dwDnNx0ybw89WoNmflcX").get(),
                       builder: (context, streamSnapshot) {
                         if (!streamSnapshot.hasData) {
                           return Center(child: CircularProgressIndicator());
                         }
                         if (streamSnapshot.connectionState ==
                             ConnectionState.done) {
                           Map<String, dynamic> data =
                           streamSnapshot.data!.data() as Map<String, dynamic>;
                           return Row(
                             children: [
                               Padding(padding: EdgeInsets.only(left: 10)),
                               Container(
                                 width: 100,
                                 height: 100,
                                 child: Column(
                                   children: [
                                     Text("${data1['person1']} ", style: TextStyle(fontSize: 30,
                                       fontWeight: FontWeight.w900,
                                       color: Colors.white,),
                                       textAlign: TextAlign.center,),
                                     Padding(
                                         padding: EdgeInsets.only(bottom: 7)),
                                     Text("kişi", style: TextStyle(
                                         color: Colors.white, fontSize: 7),
                                       textAlign: TextAlign.center,),
                                     Padding(
                                         padding: EdgeInsets.only(bottom: 7)),
                                     Text("Bağışa", style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 17,
                                         fontWeight: FontWeight.w500),
                                       textAlign: TextAlign.center,),
                                     Padding(
                                         padding: EdgeInsets.only(bottom: 1)),
                                     Text("Uygun", style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 17,
                                         fontWeight: FontWeight.w500),
                                       textAlign: TextAlign.center,),
                                   ],
                                 ),
                               ),
                               Padding(padding: EdgeInsets.only(left: 30)),
                               Container(
                                 width: 100,
                                 height: 100,
                                 child: Column(
                                   children: [
                                     Transform.scale(
                                       scale: 1.5,
                                       child: IconButton(
                                         color: Colors.white,
                                         onPressed: () {
                                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
                                         },
                                         icon: ImageIcon(
                                           AssetImage(
                                               "assets/images/Vector-34.png"
                                           ),
                                         ),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(top: 11)),
                                     Text("%25", textAlign: TextAlign.center,
                                       style: TextStyle(
                                           color: Colors.white, fontSize: 10),),
                                     Text("tamamlandı",
                                       textAlign: TextAlign.center,
                                       style: TextStyle(
                                           color: Colors.white, fontSize: 10),),

                                   ],
                                 ),
                               ),
                               Padding(padding: EdgeInsets.only(left: 30)),
                               Container(
                                 width: 100,
                                 height: 100,
                                 child: Column(
                                   children: [
                                     Text("${data['person']} ",
                                       style: TextStyle(fontSize: 30,
                                         fontWeight: FontWeight.w900,
                                         color: Colors.white,),
                                       textAlign: TextAlign.center,),
                                     Padding(
                                         padding: EdgeInsets.only(bottom: 7)),
                                     Text("kişi", style: TextStyle(
                                         color: Colors.white, fontSize: 7),
                                       textAlign: TextAlign.center,),
                                     Padding(
                                         padding: EdgeInsets.only(bottom: 7)),
                                     Text("Kan", style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 17,
                                         fontWeight: FontWeight.w500),
                                       textAlign: TextAlign.center,),
                                     Padding(
                                         padding: EdgeInsets.only(bottom: 1)),
                                     Text("İhtiyacı", style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 17,
                                         fontWeight: FontWeight.w500),
                                       textAlign: TextAlign.center,),
                                   ],
                                 ),
                               ),
                             ]
                             ,
                           );
                         }
                         return Text("Yükleniyor");
                       }

                   );
                 }
                 return Text("Yükleniyor");
               }
                ),
              ),
          ),
          FutureBuilder<QuerySnapshot>(
            future: reqBlood2.get(),
             builder: (context,  AsyncSnapshot asyncSnapshot3) {
               if(!asyncSnapshot3.hasData) {
                 return Center(child: CircularProgressIndicator());
               }
               if (asyncSnapshot3.connectionState ==
                   ConnectionState.done) {
                 List<DocumentSnapshot<Object?>>? cityData = asyncSnapshot3.data.docs;

                 return FutureBuilder<QuerySnapshot>(
                     future: reqBlood3.get(),
                     builder: (context, AsyncSnapshot asyncSnapshot2) {
                       if(!asyncSnapshot3.hasData) {
                         return Center(child: CircularProgressIndicator());
                       }
                       if (asyncSnapshot2.connectionState ==
                           ConnectionState.done) {
                         List<DocumentSnapshot> bloodTypeData = asyncSnapshot2
                             .data
                             .docs;
                         return FutureBuilder<QuerySnapshot>(
                             future: reqBlood1.get(),
                             builder: (context, AsyncSnapshot asyncSnapshot1) {
                               if(!asyncSnapshot1.hasData) {
                                 return Center(child: CircularProgressIndicator());
                               }
                               if (asyncSnapshot2.connectionState ==
                                   ConnectionState.done) {
                                 List<DocumentSnapshot> ageData = asyncSnapshot1
                                     .data
                                     .docs;
                                 return FutureBuilder<QuerySnapshot>(
                                     future: reqBlood.get(),
                                     builder: (context,
                                         AsyncSnapshot asyncSnapshot) {
                                       if(!asyncSnapshot.hasData) {
                                         return Center(child: CircularProgressIndicator());
                                       }
                                       if (asyncSnapshot2.connectionState ==
                                           ConnectionState.done) {
                                         List<
                                             DocumentSnapshot> listData = asyncSnapshot
                                             .data.docs;
                                         return Flexible(
                                           child: ListView.builder(
                                             itemCount: listData.length,
                                             itemBuilder: (context, index) {
                                               return Column(
                                                   children: [
                                                     SingleChildScrollView(
                                                       child: Column(
                                                         children: [
                                                           const Padding(
                                                               padding: EdgeInsets
                                                                   .symmetric(
                                                                   vertical: 10)),
                                                           Container(
                                                             color: Colors
                                                                 .white,
                                                             width: 320,
                                                             height: 150,
                                                             child: Row(
                                                               children: [
                                                                 Padding(
                                                                     padding: EdgeInsets
                                                                         .fromLTRB(
                                                                         10, 15,
                                                                         0,
                                                                         0)),
                                                                 Container(
                                                                   decoration: BoxDecoration(
                                                                       borderRadius: BorderRadius
                                                                           .all(
                                                                           Radius
                                                                               .circular(
                                                                               5)),
                                                                       color: Colors
                                                                           .pink[50]
                                                                   ),
                                                                   width: 115,
                                                                   height: 120,
                                                                   child: Column(
                                                                     children: [
                                                                       Container(
                                                                         width: 115,
                                                                         height: 25,
                                                                         decoration: BoxDecoration(
                                                                             borderRadius: BorderRadius
                                                                                 .only(
                                                                                 topLeft: Radius
                                                                                     .circular(
                                                                                     5),
                                                                                 topRight: Radius
                                                                                     .circular(
                                                                                     5)),
                                                                             color: Colors
                                                                                 .red[600]
                                                                         ),
                                                                       ),
                                                                       Padding(
                                                                         padding: EdgeInsets
                                                                             .symmetric(
                                                                             vertical: 33),
                                                                         child: Text(
                                                                           '${bloodTypeData[index]["Blood Type"]}',
                                                                           style: TextStyle(
                                                                               fontWeight: FontWeight
                                                                                   .w800,
                                                                               fontSize: 17),
                                                                         ),
                                                                       ),
                                                                     ],
                                                                   ),
                                                                 ),
                                                                 Column(
                                                                   mainAxisAlignment: MainAxisAlignment
                                                                       .start,
                                                                   crossAxisAlignment: CrossAxisAlignment
                                                                       .start,
                                                                   children: [
                                                                     Row(
                                                                       children: [
                                                                         Padding(
                                                                           padding: const EdgeInsets
                                                                               .only(
                                                                               left: 15,
                                                                               top: 12),
                                                                           child: Text(
                                                                             '${listData[index]["Name"]}',
                                                                             style: TextStyle(
                                                                                 fontSize: 18,
                                                                                 fontWeight: FontWeight
                                                                                     .w800),
                                                                           ),
                                                                         ),
                                                                         Padding(
                                                                           padding: EdgeInsets
                                                                               .only(
                                                                               top: 13,
                                                                               right: 5),
                                                                           child: Transform
                                                                               .scale(
                                                                             child: Container(
                                                                               width: 30,
                                                                               height: 30,
                                                                               child: IconButton(
                                                                                 icon: ImageIcon(
                                                                                   AssetImage(
                                                                                       "assets/images/Rectangle 23.png"
                                                                                   ),
                                                                                 ),
                                                                                 onPressed: () {

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
                                                                           padding: const EdgeInsets
                                                                               .only(
                                                                               left: 15,
                                                                               top: 0),
                                                                           child: Text(
                                                                             '${ageData[index]["Age"]}' +
                                                                                 " yaşında",
                                                                             style: TextStyle(
                                                                                 fontSize: 12),),

                                                                         ),
                                                                         Padding(
                                                                             padding: const EdgeInsets
                                                                                 .only(
                                                                                 left: 12,
                                                                                 top: 0),
                                                                             child: Text(
                                                                               '${cityData![index]["City"]}',
                                                                               style: TextStyle(
                                                                                   fontSize: 12),)
                                                                           // cityData.forEach((element) { })

                                                                         ),
                                                                       ],
                                                                     ),
                                                                     Row(
                                                                       children: [
                                                                         Padding(
                                                                           padding: const EdgeInsets
                                                                               .only(
                                                                               top: 30,
                                                                               left: 20),
                                                                           child: SizedBox(
                                                                             width: 120,
                                                                             height: 30,
                                                                             child: ElevatedButton(
                                                                               style: ElevatedButton
                                                                                   .styleFrom(
                                                                                 backgroundColor: Colors
                                                                                     .green[400],),
                                                                               onPressed: () {},
                                                                               child: Text(
                                                                                   'Destek Ol',
                                                                                   style: TextStyle(
                                                                                       fontSize: 11)),

                                                                             ),
                                                                           ),
                                                                         ),
                                                                         Padding(
                                                                           padding: EdgeInsets
                                                                               .only(
                                                                               left: 7,
                                                                               top: 29),
                                                                           child: Container(
                                                                             color: Colors
                                                                                 .pink[50],
                                                                             width: 30,
                                                                             height: 28,
                                                                             child: IconButton(
                                                                               onPressed: () {
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
                                                       ),
                                                     ),
                                                   ]
                                               );
                                             },
                                           ),
                                         );
                                       }
                                       return Text("yükleniyor");
                                     }
                                 );
                               }
                               return Text("yükleniyor");
                             }
                         );
                       }
                       return Text("yükleniyor");
                     }
                 );
               }
               return Text("yükleniyor");
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
                        builder: (context) => MainPage()));
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
                            builder: (context) => const SearchBlood()));
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

