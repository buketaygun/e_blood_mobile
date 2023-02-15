import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class verifyPhoneNumber extends StatefulWidget {
  const verifyPhoneNumber({super.key});

  @override
  State<verifyPhoneNumber> createState() => _verifyPhoneNumberState();
}

class _verifyPhoneNumberState extends State<verifyPhoneNumber> {
  FirebaseAuth auth = FirebaseAuth.instance;

  late  String phoneNum;
  bool showState = false;
  TextEditingController phonenumbercontroller = TextEditingController();

  TextEditingController otpController = TextEditingController();

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('User');

  late var receivedID ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("assd"),
      ),
      body: Column(
        children: [
          FutureBuilder<DocumentSnapshot> (
            future: usersCollection.doc(auth.currentUser?.uid).get(),
            builder: (ctx, streamSnapshot) {
              if (!streamSnapshot.hasData) {
                print("Henüz bilgilerinizi girmediniz");
              }
              if (streamSnapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                streamSnapshot.data!.data() as Map<String, dynamic>;
                phoneNum="${data['Phone Number']}";
                Text(
                  "${data['Phone Number']} : numaralı telefonunuza gelen aktivasyon kodunu girin ",
                  style: const TextStyle(fontSize: 17),
                );
                auth
                    .verifyPhoneNumber(
                    phoneNumber: phoneNum,
                    verificationCompleted:
                        (PhoneAuthCredential credential) async {
                      await auth.signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      if (e.code == 'invalid-phone-number') {
                        print('The provided phone number is not valid.');
                      }
                    },
                    codeSent:
                        (String verificationId, int? resendToken) async {
                      String smsCode = 'xxxx';
                      this.receivedID.value=verificationId;

                      // Create a PhoneAuthCredential with the code
                      PhoneAuthCredential credential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId,
                          smsCode: smsCode);

                      await auth.signInWithCredential(credential);
                    },
                    timeout: const Duration(seconds: 60),
                    codeAutoRetrievalTimeout: (String verificationId) {
                      this.receivedID.value=verificationId;
                    });
              }
              return const Text('Yükleniyor');
            },
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Kodu Giriniz',
            ),
            onChanged: (value) {
              receivedID=value;
            },
          ),
          ElevatedButton(
            onPressed: () async{

            },
            child: Text("Kod Gönder"),
          ),
        ],
      ),
    );
  }


}
