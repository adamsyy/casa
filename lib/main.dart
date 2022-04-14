//@dart=2.9
import 'dart:async';

import 'package:casa/interest_screens/music.dart';
import 'package:casa/interest_screens/music_list.dart';
import 'package:casa/services/confession.dart';
import 'package:casa/welcome_screens/Firstscreen.dart';
import 'package:casa/welcome_screens/Lookingfor.dart';
import 'package:casa/welcome_screens/Profilescreen.dart';
import 'package:casa/welcome_screens/Signup.dart';
import 'package:casa/welcome_screens/login.dart';
import 'package:casa/welcome_screens/uploadconfession.dart';
import 'package:casa/welcome_screens/Welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Animation/FadeAnimation.dart';

final _auth = FirebaseAuth.instance;
final fire = FirebaseFirestore.instance;
var list = <String>[];
String username = null;
String gender;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _CollectionReference = fire.collection("confession");

  @override
  void initState() {
    super.initState();
    localusername();

    // TODO: implement initState
//getDocs();
    try {
      if (_auth.currentUser.email != null) {
        print(_auth.currentUser.email);
        getusername(_auth.currentUser.email);
      }
    } catch (e) {
      print("error adich");
    }
  }

  // Future<dynamic> getDocs() async {
  // fire.collection("male").add({
  //   "name1":"
  // })
  // }
  Future getusername(String email) async {
    await fire
        .collection("music_match")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                if (doc["email"] == email) {
                  print(doc["name"]);
                  username = doc["name"];
                }
              })
            });
    return username;
  }

  localusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      username = prefs.getString('name');
    });
  }
  localgender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      gender = prefs.getString('gender');
    });
  }


  Future getphone(String name) async {
    String phone;
    await fire
        .collection("music_match")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                if (doc["name"] == name) {
                  phone = doc["phone"];
                }
              })
            });
    return phone;
  }
  Future get(String name) async {
    String phone;
    await fire
        .collection("music_match")
        .get()
        .then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((doc) {
        if (doc["name"] == name) {
          phone = doc["phone"];
        }
      })
    });
    return phone;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Firstscreen(username: username,));
  }
}
