//@dart=2.9
import 'package:casa/Animation/FadeAnimation.dart';
import 'package:casa/interest_screens/music_list.dart';
import 'package:casa/services/confession.dart';
import 'package:casa/welcome_screens/Signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
String content;
String target;
String time;
final _auth = FirebaseAuth.instance;
String email;
String pass;

class Loginfirebase extends StatefulWidget {
  @override
  _LoginfirebaseState createState() => _LoginfirebaseState();
}

class _LoginfirebaseState extends State<Loginfirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text("Casa",style: TextStyle(fontSize: 20), ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 70, 30, 30),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.8,
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.1)))),
                                    child: TextField(
                                      onChanged: (value){
                                        email=value;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email",
                                          hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(onChanged: (value){
                                      pass=value;
                                    },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            2,
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Colors.pink,
                                    Colors.pink,
                                  ])),
                              child: Center(
                                child: GestureDetector(
                                    onTap: ()async {
                                      final user = await _auth.signInWithEmailAndPassword(
                                          email: email, password: pass);
                                      String username=await getusername(email);
                                      print(username);
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setString('email', email);
                                      prefs.setString('name', username);

                                     var gender="FEMALE";
                                      await fire3
                                          .collection("male")
                                          .get()
                                          .then(
                                              (QuerySnapshot querySnapshot) =>
                                          {
                                            querySnapshot.docs
                                                .forEach((doc) {
                                             if(doc["name"]==username){
                                            setState(() {
                                              gender="MALE";
                                            });
                                             }
                                            })
                                          });
                                      prefs.setString('gender', gender);


    if (user != null) {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) {
    return Music_list(name: username,);
    })); }
                                    },

                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            )),
                        SizedBox(
                          height: 70,
                        ),
                        FadeAnimation(
                            1.5,
                            GestureDetector(onTap: (){
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Signupfirebase()));
                            },
                              child: Text(
                                "Dont have an account? Sign up!",
                                style: TextStyle(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


Future getusername(String email)async{

  await fire.collection("music_match").get().then((QuerySnapshot querySnapshot) => {
    querySnapshot.docs
        .forEach((doc) {
      if(doc["email"]==email){
        print(doc["name"]);
        username=doc["name"];
      }
    })
  }); return username;
}