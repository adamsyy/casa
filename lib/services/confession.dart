//@dart=2.9
import 'dart:ui';

import 'package:casa/interest_screens/music_list.dart';
import 'package:casa/welcome_screens/Profilescreen.dart';
import 'package:casa/welcome_screens/Signup.dart';
import 'package:casa/welcome_screens/login.dart';
import 'package:casa/welcome_screens/uploadconfession.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:page_transition/page_transition.dart';
import '../main.dart';

final _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var CollectionReference2 = _firestore.collection("trending");

class Confession extends StatefulWidget {
  String username;
  String gender;
  Confession({String username,String gender }) {
    this.username = username;
this.gender=gender;
  }

  @override
  _ConfessionState createState() => _ConfessionState();
}

class _ConfessionState extends State<Confession> {
  int index = 1;
  @override
  void initState() {
    // TODO: implement initState

    final _CollectionReference = _firestore.collection("confession");

    super.initState();
  }

  final _CollectionReference = fire.collection("confession");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: Color.fromRGBO(242, 169, 184, 1),
      body: StreamBuilder(
        stream: CollectionReference2.snapshots(),
        builder: (context2, snapshot1) {
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("confession")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 8, 0, 0),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.solidHeart),
                              GestureDetector(
                                  onTap: () {

                                  },
                                  child: Text(
                                    ' Trending',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Container(
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot1.data.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot documentSnapshot1 =
                                      snapshot1.data.docs[index];
                                  return Cardsmall(
                                    content: documentSnapshot1["content"],
                                    target: documentSnapshot1["target"],
                                  );
                                }),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot documentSnapshot =
                                  snapshot.data.docs[index];
                              return documentSnapshot["allowed"] == true
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Cardconf(
                                          time: documentSnapshot["date"]
                                              .toString(),
                                          like: documentSnapshot["likes"] ?? 3,
                                          name: documentSnapshot["target"] ??
                                              "test",
                                          text: documentSnapshot["content"] ??
                                              "test"),
                                    )
                                  : Text("");
                            },
                            itemCount: snapshot.data.docs.length),
                      ],
                    ),
                  );
                } else {
                  return Center(child: CupertinoActivityIndicator());
                }
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
var x;
int i=0;
final list = <String>[];
Map<int,String> map=Map();
          await FirebaseFirestore.instance.collection("male").get().then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
             x= doc["name"];
 if(x=="Abhishek S Kurup"){
   FirebaseFirestore.instance.collection("male").doc(doc.id).delete();
 }
              list.add(x);
            })

          });

          print(list);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        child: Icon(FontAwesomeIcons.plus),
        backgroundColor: Color.fromRGBO(255, 145, 184, 1),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(242, 169, 184, 1),
        index: index,
        items: [
          Icon(Icons.music_note, size: 30),
          Icon(FontAwesomeIcons.solidHeart, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            this.index = index;

            print(index);
          });
          if (index == 0) {
            print(widget.username);
            if (widget.username != null) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Music_list(
                        name: widget.username,
                      )));
            } else {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: Loginfirebase()));
            }
          }
          if (index == 2) {
            print(widget.username);
            if (widget.username != null) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: ProfilePage(gender: widget.gender,
                        name: widget.username,
                      )));
            } else {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: ProfilePage(
                        name:widget.username,
                      )));
            }
          }
        },
        height: MediaQuery.of(context).size.height / 17.5,
      ),
    );
  }
}

// StreamBuilder(
// stream: _CollectionReference.snapshots(),
// builder: (context, snapshot) {
// if (snapshot.hasData) {
//
// return ListView.builder(
// shrinkWrap: true,
// itemCount: snapshot.data.docs.length,
// itemBuilder: (context, index) {
// DocumentSnapshot documentSnapshot =
// snapshot.data.docs[index];
// // String _phoneNo =documentSnapshot["phoneNo"];
// return Row(
// children: [
// SizedBox(
// width: 20,
// ),
// Container(
// width: MediaQuery.of(context).size.width / 2,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// documentSnapshot["content"],
// style: TextStyle(color: Colors.black),
// ),
// SizedBox(
// height: 110,
// ),Heart
// Text(documentSnapshot["likes"].toString(),
// style: TextStyle(color: Color(0xff868597))),
// SizedBox(
// height: 10,
// ),
// Text(documentSnapshot["target"],CurvedNavigationBar
// style: TextStyle(color: Color(0xff868597))),
// ],
// ),
// ),
// ],
// );
// });
// } else {
// return CircularProgressIndicator();
// }
// },
// ),

class Hearticon extends StatefulWidget {
  bool check;
  Hearticon({bool check}) {
    this.check = check;
  }

  @override
  _HearticonState createState() => _HearticonState();
}

class _HearticonState extends State<Hearticon> {
  hloogys2() {
    setState(() {
      widget.check = true;
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return widget.check
        ? Icon(
            FontAwesomeIcons.solidHeart,
            color: Colors.red,
            size: 30,
          )
        : Icon(FontAwesomeIcons.solidHeart,
            color: Color.fromRGBO(255, 169, 184, 1));
  }
}

class Cardconf extends StatefulWidget {
  String text, name;
  String time;
  int like;
  Cardconf({String text, String name, int like, String time}) {
    this.like = like;
    this.text = text;
    this.name = name;
    this.time = time;
  }
  @override
  _CardconfState createState() => _CardconfState();
}

class _CardconfState extends State<Cardconf> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white.withOpacity(0.4),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(242, 169, 184, 1),
                    blurRadius: 12,
                    offset: Offset(0, 12))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 15, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    '@' + widget.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 12, 12, 18),
                child: Container(
                    height: 240,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          widget.text,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 18),
                        ))),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.time + " Feb"),
                  ),
                  SizedBox(
                    width: 250,
                  ),
                  Text(widget.like.toString()),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () async{
                        print("heyy");
                        check = !check;
                        if(check==true){  await fire.collection("confession").get().then((QuerySnapshot querySnapshot) => {
                          querySnapshot.docs
                              .forEach((doc) {
                            if(doc["content"]==widget.text){
                              print(doc.id);
                              fire.collection("confession").doc(doc.id).update({
                                "likes":widget.like+1,
                              });
                            }
                          })});}
                        else{
                          await fire.collection("confession").get().then((QuerySnapshot querySnapshot) => {
                            querySnapshot.docs
                                .forEach((doc) {
                              if(doc["content"]==widget.text){
                                print(doc.id);
                                fire.collection("confession").doc(doc.id).update({
                                  "likes":widget.like-1,
                                });
                              }
                            })});
                        }



                        setState(() {});

                      },
                      child: Hearticon(
                        check: check,
                      ))
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}

class Cardsmall extends StatefulWidget {
  String target;
  String content;
  Cardsmall({String target, String content}) {
    this.target = target;
    this.content = content;
  }

  @override
  _CardsmallState createState() => _CardsmallState();
}

class _CardsmallState extends State<Cardsmall> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white.withOpacity(0.4),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(242, 169, 184, 1),
                      blurRadius: 12,
                      offset: Offset(0, 12))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(9, 15, 0, 0),
                  child: Text(
                    '@' + widget.target,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 12, 12, 10),
                  child: Container(
                      height: 80,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            widget.content,
                            style: TextStyle(fontSize: 12),
                          ))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
