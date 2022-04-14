//@dart=2.9
import 'package:casa/Animation/FadeAnimation.dart';
import 'package:casa/services/confession.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
String content;
String target;
String time;

final fire2 = FirebaseFirestore.instance;

class Feedbackformadmin extends StatefulWidget {
  String username;
  Feedbackformadmin({String username}){
    this.username=username;
  }
  @override
  _FeedbackformadminState createState() => _FeedbackformadminState();
}

class _FeedbackformadminState extends State<Feedbackformadmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[

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


                                  Container(height: 350,
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(onChanged: (value){
                                      content=value;
                                    },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter your complaint here",
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
                                    Color.fromRGBO(242, 169, 184, 1),
                                    Color.fromRGBO(242, 169, 184, 1),
                                  ])),
                              child: Center(
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Confession(username: widget.username)),
                                      );
                                      fire2.collection("report").add({
                                        "content":content,


                                      });
                                    },

                                    child: Text(
                                      "Report",
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
