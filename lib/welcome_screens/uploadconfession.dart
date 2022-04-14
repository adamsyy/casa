//@dart=2.9
import 'package:casa/Animation/FadeAnimation.dart';
import 'package:casa/services/confession.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
String content;
String target;
String time;
final fire2 = FirebaseFirestore.instance;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text("Trust me, no ones gonna know 😉",style: TextStyle(fontSize: 20), ),
                  Text("Confessions need to get approved by the admin to show in the app",style: TextStyle(fontSize: 10), ),

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
                                        target=value;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Who are your mentioning?",
                                          hintStyle:
                                              TextStyle(color: Colors.grey[400])),
                                    ),
                                  ),

                                  Container(height: 350,
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(onChanged: (value){
                                      content=value;
                                    },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Your confession",
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Confession()),
                                      );
                                      fire2.collection("confession").add({ "content":content,
"allowed":false,
                                        "target":target,
                                        "likes":0,
"date":DateTime.now().day.toString(),

                                      });
                                    },

                                    child: Text(
                                      "Post",
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
                            Text(
                              "",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
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
