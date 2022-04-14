//@dart=2.9
import 'package:casa/interest_screens/music_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var CollectionReference6 = _firestore.collection("coffee");

class Coffeedate extends StatefulWidget {
  String username;
  Coffeedate({String username}) {
    this.username = username;
  }
  @override
  _CoffeedateState createState() => _CoffeedateState();
}

class _CoffeedateState extends State<Coffeedate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "People looking for a coffee date",
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Color.fromRGBO(242, 169, 184, 1),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("coffee").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data.docs[index];
                            return documentSnapshot["name"] != widget.username
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Cardconf2(
                                        name:
                                            documentSnapshot["name"] ?? "test",
                                        phone: documentSnapshot["phone"] ??
                                            "test"),
                                  )
                                : Text("");
                          },
                          itemCount: snapshot.data.docs.length),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}

class Cardconf2 extends StatefulWidget {
  String name;
  String phone;

  Cardconf2({String name, String phone}) {
    this.name = name;
    this.phone = phone;
  }
  @override
  _Cardconf2State createState() => _Cardconf2State();
}

class _Cardconf2State extends State<Cardconf2> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
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
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(9, 15, 0, 0),
          //       child: Text(
          //         "Find a coffee date",
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //       ),
          //     ),
          //     SizedBox(height: 90,),
          //     Center(child: Icon(Icons.,size: 100,),),
          //   ],
          // ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(width:MediaQuery.of(context).size.width / 2.2 ,
                      child: Text(
                       widget.name,
                        style: TextStyle(fontSize: 18),
                      ),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.3,
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () async {
                          String url = "https://wa.me/+91" + widget.phone;
                          await launch(url);
                        },
                        child: Icon(FontAwesomeIcons.whatsapp)),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
