import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_blood/LoginPage.dart';
import 'package:e_blood/SignUpPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Blood',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'e-Blood'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
     // appBar: AppBar(
       // title: Text(widget.title),
     // ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(40),
        child: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width*1,
                height: height*0.20,
                child: Image.asset('assets/images/Group 43.png', fit:BoxFit.fill ,),
              ),
              Padding(padding: EdgeInsets.all(20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                            },
                            child: Text("Giriş Yap", style: TextStyle(color: Colors.red),),

                        ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                        },
                        child: Text("Kaydet"),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
