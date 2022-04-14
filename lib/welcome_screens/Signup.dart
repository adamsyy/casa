//@dart=2.9


import 'dart:math';
import 'package:casa/Animation/FadeAnimation.dart';
import 'package:casa/interest_screens/music.dart';
import 'package:casa/interest_screens/music_list.dart';
import 'package:casa/services/confession.dart';
import 'package:casa/welcome_screens/Lookingfor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



String warningtext=" ";
String content;
String target;
String time;
final _auth = FirebaseAuth.instance;
String email;
String pass;
String name;
String phone;
String intro;
String gender = "MALE";
final fire3 = FirebaseFirestore.instance;

class Signupfirebase extends StatefulWidget {
  @override
  _SignupfirebaseState createState() => _SignupfirebaseState();
}

class _SignupfirebaseState extends State<Signupfirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Casa",
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey),
                  ),
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
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      onChanged: (value) {
                                        name = value;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      onChanged: (value) {
                                        intro = value;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              "Introduce yourselves in one line",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      onChanged: (value) {
                                        phone = value;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Phone",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.1)))),
                                    child: TextField(
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      onChanged: (value) {
                                        pass = value;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Looking for?'),
                        DropdownButton(
                           hint: Text(gender),
                            items: dropdownItems,
                            onChanged: (val) {
                             setState(() {
                               gender = val;
                             });

                            }),
                        FadeAnimation(
                            2,
                            GestureDetector(onTap: ()async{
                              if(pass.length<6){
    setState(() {
    warningtext="Password should be atleast 6 charracters long";
    });
    print("hshs");
    }

    String name1, name2, name3, name4, name5;

    String intro1,
    intro2,
    intro3,
    intro4,
    intro5;
    String phone1, phone2, phone3;

    var random = Random();
    int size = 0;


                              if (gender == "MALE") {
                                await fire3
                                    .collection("female").add({
                                  "name":name,
                                  "intro":intro,
                                  "phone":phone,
                                });
                              } else {
                                await fire3
                                    .collection("male").add({
                                  "name":name,
                                  "intro":intro,
                                  "phone":phone,
                                });
                              }


    if (gender == "FEMALE") {
    await fire3
        .collection("female")
        .get()
        .then(
    (QuerySnapshot querySnapshot) =>
    {
    querySnapshot.docs
        .forEach((doc) {
    size++;
    })
    });
    } else {
    await fire3
        .collection("male")
        .get()
        .then(
    (QuerySnapshot querySnapshot) =>
    {
    querySnapshot.docs
        .forEach((doc) {
    size++;
    })
    });
    }

    int val1 =
    random.nextInt((size / 3).toInt());
    int val2 =
    random.nextInt((size / 2).toInt());
    int val3 = random.nextInt(size);
    if (val1 == val2) {
    val2 = val1 + 1;
    }
    if (val1 == val3) {
    val1 = val3 - 1;
    }
    if (val1 == val2) {
    val1 = val2 - 1;
    }
    int i = 0;
    if (gender == "FEMALE") {
    await fire3
        .collection("female")
        .get()
        .then(
    (QuerySnapshot querySnapshot) =>
    {
    querySnapshot.docs
        .forEach((doc) {
    if (i == val1) {
    name1 = doc["name"];
    intro1 = doc["intro"];
    phone1 = doc["phone"];
    }

    if (i == val2) {
    name2 = doc["name"];
    intro2 = doc["intro"];
    phone2 = doc["phone"];
    }
    if (i == val3) {
    name3 = doc["name"];
    intro3 = doc["intro"];
    phone3 = doc["phone"];
    }
    i++;
    })
    });
    }
    if (gender == "MALE") {
    await fire3
        .collection("male")
        .get()
        .then(
    (QuerySnapshot querySnapshot) =>
    {
    querySnapshot.docs
        .forEach((doc) {
    if (i == val1) {
    name1 = doc["name"];
    intro1 = doc["intro"];
    phone1 = doc["phone"];
    }

    if (i == val2) {
    name2 = doc["name"];
    intro2 = doc["intro"];
    phone2 = doc["phone"];
    }
    if (i == val3) {
    name3 = doc["name"];
    intro3 = doc["intro"];
    phone3 = doc["phone"];
    }
    i++;
    })
    });
    }

    // int i = 0;
    // await fire3
    //     .collection("music_match")
    //     .get()
    //     .then(
    //         (QuerySnapshot querySnapshot) => {
    //       querySnapshot.docs
    //           .forEach((doc) {
    //         if (i == val1) {
    //           if (doc["gender"] !=
    //               gender) {
    //             name1 = doc["name"];
    //             intro1 = doc["intro"];
    //           }i++; val1++;
    //         }
    //         if (i == val2) {
    //           if (doc["gender"] !=
    //               gender) {
    //             name2 = doc["name"];
    //             intro2 = doc["intro"];
    //           }
    //         }
    //         if (i == val3) {
    //           if (doc["gender"] !=
    //               gender) {
    //             name3 = doc["name"];
    //             intro3 = doc["intro"];
    //           }
    //         }
    //         i++;
    //       })
    //     });
    try{    final newuser = await _auth
        .createUserWithEmailAndPassword(
    email: email, password: pass);

    fire3
        .collection("music_match")
        .doc(name)
        .set({
    "email": email,
    "name": name,
    "phone": phone,
    "intro": intro,
    "name1": name1,
    "intro1": intro1,
    "name2": name2,
    "intro2": intro2,
    "name3": name3,
    "intro3": intro3,
    "phone1": phone1,
    "phone2": phone2,
    "phone3": phone3,
    });


    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('name', name);
    prefs.setString('gender', gender);
    print(gender);
    if (newuser != null) {
    Navigator.push(context,
    MaterialPageRoute(
    builder: (context) {
    return Music(name: name,);
    }));
    }

    }catch(e){setState(() {
    warningtext="try a different email id";
    });}






    },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Colors.pink,
                                      Colors.pink,
                                    ])),
                                child: Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 70,
                        ),
                        FadeAnimation(
                            1.5,
                            Text(
                              warningtext,
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

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("MALE"), value: "MALE"),
    DropdownMenuItem(child: Text("FEMALE"), value: "FEMALE"),
  ];
  return menuItems;
}
