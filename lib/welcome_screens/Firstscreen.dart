//@dart=2.9
import 'dart:async';

import 'package:casa/services/confession.dart';
import 'package:flutter/material.dart';

class Firstscreen extends StatefulWidget {
String username;
String gender;
Firstscreen({String username,String gender}){
  this.username=username;
  this.gender=gender;
}

  @override
  _FirstscreenState createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 1500), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Confession(username: widget.username,gender: widget.gender,)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Color.fromRGBO(242, 169, 184, 1),
      body: Center(
        child:Image.asset('assets/images/logo.png',height: 170,),
      ),
    );
  }
}
