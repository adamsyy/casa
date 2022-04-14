//@dart=2.9
import 'dart:math';

import 'package:casa/Animation/FadeAnimation.dart';
import 'package:casa/services/confession.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String gender;
final fire3 = FirebaseFirestore.instance;
class Lookingfor extends StatefulWidget {
  String name;
  Lookingfor({String name}){
    this.name=name;
  }
  @override
  _LookingforState createState() => _LookingforState();
}

class _LookingforState extends State<Lookingfor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text("Im looking for a",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.grey), ),
                  DropdownButton(value: "OTHER",items: dropdownItems, onChanged: (val){
gender=val;
                  }),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 70, 30, 30),
                    child: Column(
                      children: <Widget>[

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
                                    onTap: ()async {
                                      String name1,name2,name3,name4,name5;
                                      String intro1,intro2,intro3,intro4,intro5;
                                      var random=Random();
                                      int size=0;
                                      await fire3.collection("music_match").get().then((QuerySnapshot querySnapshot) => {
                                        querySnapshot.docs.forEach((doc) {

                                          size++;
                                        })
                                      });

                                      await fire3.collection("music_match").doc(widget.name).update({
                                    "gender":gender,

                                      });
                                    },

                                    child: Text(

                                      "Proceed",
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

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("MALE"),value: "MALE"),
    DropdownMenuItem(child: Text("FEMALE"),value: "FEMALE"),
    DropdownMenuItem(child: Text("OTHER"),value: "OTHER"),

  ];
  return menuItems;
}