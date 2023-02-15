import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodePage extends StatefulWidget{
  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ap"),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Please enter code',
            ),
          )
        ],
      ),
    );

  }
}