//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'music_list.dart';

final growableList = <String>[];
final fire4 = FirebaseFirestore.instance;
class Music extends StatefulWidget {
  String name;
  Music({String name}){
    this.name=name;
  }

  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  bool check11 = false;
  bool check12 = false;
  bool check13 = false;
  bool check14 = false;
  bool check16 = false;
  bool check17 = false;
  bool check18 = false;
  bool check19 = false;

  bool check21 = false;
  bool check22 = false;
  bool check23 = false;
  bool check24 = false;
  bool check26 = false;
  bool check27 = false;
  bool check28 = false;
  bool check29 = false;

  bool check31 = false;
  bool check32 = false;
  bool check33 = false;
  bool check34 = false;
  bool check36 = false;
  bool check37 = false;
  bool check38 = false;
  bool check39 = false;

  bool check41 = false;
  bool check42 = false;
  bool check43 = false;
  bool check44 = false;
  bool check46 = false;
  bool check47 = false;
  bool check48 = false;
  bool check49 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          toolbarHeight: 2,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 12.5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                      "What type of music do you prefer? Select upto 5 options for options for each quesions"),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        growableList.add("pop");
                        check11 = !check11;
                        setState(() {});
                      },
                      child: Chipcard(
                        text: " pop",
                        check: check11,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check12 = !check12;
                        setState(() {});
                        growableList.add("folk");
                      },
                      child: Chipcard(
                        text: " folk",
                        check: check12,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check13 = !check13;
                        setState(() {});
                        growableList.add("indie");
                      },
                      child: Chipcard(
                        text: " indie",
                        check: check13,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check14 = !check14;
                        setState(() {});
                        growableList.add("rock");
                      },
                      child: Chipcard(
                        text: " rock",
                        check: check14,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        check16 = !check16;
                        setState(() {});
                        growableList.add("r&b");
                      },
                      child: Chipcard(
                        text: " R&B",
                        check: check16,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check17 = !check17;
                        setState(() {});
                        growableList.add("hindi");
                      },
                      child: Chipcard(text: " hindi", check: check17),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check18 = !check18;
                        setState(() {});
                        growableList.add("malayalam");
                      },
                      child: Chipcard(
                        text: " malayalam",
                        check: check18,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check19 = !check19;
                        setState(() {});
                        growableList.add("romantic");
                      },
                      child: Chipcard(
                        text: " romantic",
                        check: check19,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              //done
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 12.5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Select your top 5 artists from the following"),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        check21 = !check21;
                        setState(() {});
                        growableList.add("prateek");
                      },
                      child: Chipcard(
                        text: " prateek kuhad",
                        check: check21,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check22 = !check22;
                        setState(() {});
                        growableList.add("bruno");
                      },
                      child: Chipcard(
                        text: " bruno mars",
                        check: check22,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check23 = !check23;
                        setState(() {});
                        growableList.add("lil");
                      },
                      child: Chipcard(
                        text: " lil nas x",
                        check: check23,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check24 = !check24;
                        setState(() {});
                        growableList.add("arijit");
                      },
                      child: Chipcard(
                        text: " arijit singh",
                        check: check24,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        check26 = !check26;
                        setState(() {});
                        growableList.add("taylor");
                      },
                      child: Chipcard(
                        text: " taylor swift",
                        check: check26,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check27 = !check27;
                        setState(() {});
                        growableList.add("ed");
                      },
                      child: Chipcard(text: " ed sheeran", check: check27),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check28 = !check28;
                        setState(() {});
                        growableList.add("shreya");
                      },
                      child: Chipcard(
                        text: " shreya goshal",
                        check: check28,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check29 = !check29;
                        setState(() {});
                        growableList.add("ritviz");
                      },
                      child: Chipcard(
                        text: " ritviz",
                        check: check29,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 12.5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Select your top 5 music from the following"),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        check31 = !check31;
                        setState(() {});
                        growableList.add("happier");
                      },
                      child: Chipcard(
                        text: " happier",
                        check: check31,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check32 = !check32;
                        setState(() {});
                        growableList.add("ranjha");
                      },
                      child: Chipcard(
                        text: " ranjha",
                        check: check32,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check33 = !check33;
                        setState(() {});
                        growableList.add("safarnama");
                      },
                      child: Chipcard(
                        text: " safarnama",
                        check: check33,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check34 = !check34;
                        setState(() {});
                        growableList.add("heat");
                      },
                      child: Chipcard(
                        text: " heat waves",
                        check: check34,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        check36 = !check36;
                        setState(() {});
                        growableList.add("dusk");
                      },
                      child: Chipcard(
                        text: " dusk till dawn",
                        check: check36,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check37 = !check37;
                        setState(() {});
                        growableList.add("inf");
                      },
                      child: Chipcard(text: " infinity", check: check37),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check38 = !check38;
                        setState(() {});
                        growableList.add("ilikme");
                      },
                      child: Chipcard(
                        text: " i like me better",
                        check: check38,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check39 = !check39;
                        setState(() {});
                        growableList.add("srivalli");
                      },
                      child: Chipcard(
                        text: " srivalli",
                        check: check39,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 12.5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Select your top 5 favourite music bands"),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        check41 = !check41;
                        setState(() {});
                        growableList.add("oned");
                      },
                      child: Chipcard(
                        text: " one direction",
                        check: check41,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check42 = !check42;
                        setState(() {});
                        growableList.add("bts");
                      },
                      child: Chipcard(
                        text: " bts",
                        check: check42,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check43 = !check43;
                        setState(() {});
                        growableList.add("thedoors");
                      },
                      child: Chipcard(
                        text: " the doors",
                        check: check43,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check44 = !check44;
                        setState(() {});
                        growableList.add("nirvana");
                      },
                      child: Chipcard(
                        text: " nirvana",
                        check: check44,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        check46 = !check46;
                        setState(() {});
                        growableList.add("wcmt");
                      },
                      child: Chipcard(
                        text: " when chai met toast",
                        check: check46,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check47 = !check47;
                        setState(() {});
                        growableList.add("euphoria");
                      },
                      child: Chipcard(text: " euphoria", check: check47),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check48 = !check48;
                        setState(() {});
                        growableList.add("agnee");
                      },
                      child: Chipcard(
                        text: " agnee",
                        check: check48,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        check49 = !check49;
                        setState(() {});
                        growableList.add("black");
                      },
                      child: Chipcard(
                        text: " blackpink",
                        check: check49,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
        SizedBox(height: 20,),
        GestureDetector(onTap: (){
          print(growableList);
          fire4.collection("music").doc(widget.name).set({
            "list":growableList,
          });
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: Music_list(
                    name: widget.name,
                  )));
        },
          child: Container(
            height: 40,width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(242, 169, 184, 1),
                  Color.fromRGBO(242, 169, 184, 1),
                ])),
            child: Center(
              child: Text(
                "Proceed",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
           ],

          ),
        ));
  }
}

class Chipcard extends StatefulWidget {
  bool check;
  String text;
  Chipcard({String text, bool check}) {
    this.text = text;
    this.check = check;
  }
  @override
  _ChipcardState createState() => _ChipcardState();
}

class _ChipcardState extends State<Chipcard> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: widget.check == true
          ? Color.fromRGBO(242, 169, 184, 1)
          : Colors.grey.withOpacity(0.3),
      label: Text(widget.text),
    );
  }
}
