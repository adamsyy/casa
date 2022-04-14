//@dart=2.9
//@dart=2.9
import 'dart:ui';
import 'package:casa/services/confession.dart';
import 'package:casa/welcome_screens/Coffeedate.dart';
import 'package:casa/welcome_screens/Profilescreen.dart';
import 'package:casa/welcome_screens/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:casa/welcome_screens/uploadconfession.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

import '../main.dart';
String gender2;
var x;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var CollectionReference2 = _firestore.collection("music_match");
class Music_list extends StatefulWidget {

String name;

Music_list({String name}){
  this.name=name;

}
  @override
  _Music_listState createState() => _Music_listState();
}

class _Music_listState extends State<Music_list> {
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState

    final _CollectionReference = _firestore.collection("confession");

    super.initState();
    localgenderlist();
    //isfemale();
  }

  // Future isfemale()async{
  //   await fire.collection("male").get().then((QuerySnapshot querySnapshot) => {
  //     querySnapshot.docs
  //         .forEach((doc) {
  //       if(doc["name"]==widget.name){
  //        setState(() {
  //          x=true;
  //          print(x);
  //        });
  //       }
  //     })});setState(() {
  //       x=false;
  //     });;
  //     print(x);
  // }




  localgenderlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      gender2 = prefs.getString('gender');
      print(gender2);
    });
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
      body:StreamBuilder(stream:CollectionReference2.snapshots(),builder: (context2,snapshot1){
        return  StreamBuilder(
            stream: FirebaseFirestore.instance.collection("confession").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return gender2=="MALE"?SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 0, 0),
                      child: Row(
                        children: [Icon(FontAwesomeIcons.solidHeart),
                          Text(' Your Top music matches',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                        ],
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Container(
                          height: 170,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot1.data.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot documentSnapshot1 =
                                snapshot1.data.docs[index];
                                if(documentSnapshot1["name"]==widget.name){return Row(
                                  children: [
                                    Cardsmall(content: documentSnapshot1["intro1"],target: documentSnapshot1["name1"],phone:documentSnapshot1["phone1"] ,),
                                    Cardsmall(content: documentSnapshot1["intro2"],target: documentSnapshot1["name2"],phone:documentSnapshot1["phone2"] ),
                                    Cardsmall(content: documentSnapshot1["intro3"],target: documentSnapshot1["name3"],phone:documentSnapshot1["phone3"] ),
                                  ],
                                );}
                                else{
print("UGHHHHH");                                  return Text("");}
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
                            return documentSnapshot["allowed"]==true?Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(onTap: ()async{
                                int checker=0;
var phone=await getphone(widget.name);
print(phone);
await fire.collection("coffee").get().then((QuerySnapshot querySnapshot) => {
  querySnapshot.docs
      .forEach((doc) {
  if(doc["name"]==widget.name){
    checker=1;
  }
  })
});
if(checker==0){await fire.collection("coffee").add({
  "name":widget.name,
  "phone":phone,
});}

Navigator.push(
    context,
    PageTransition(
        type: PageTransitionType.fade, child: Coffeedate(username: widget.name,)));

                              },child: Cardconf(time:documentSnapshot["date"].toString() ,like: documentSnapshot["likes"]??3, name: documentSnapshot["target"]??"test", text: documentSnapshot["content"]??"test")),
                            ):Text("") ;
                          },
                          itemCount: 1),
                    ],
                  ),
                ):SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 0, 0),
                      child: Row(
                        children: [Icon(FontAwesomeIcons.solidHeart),
                          Text(' Your Top music matches',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                        ],
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Container(
                          height: 170,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot1.data.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot documentSnapshot1 =
                                snapshot1.data.docs[index];
                                if(documentSnapshot1["name"]==widget.name){return Row(
                                  children: [
                                    Cardsmallmale(content: documentSnapshot1["intro1"],target: documentSnapshot1["name1"],phone:documentSnapshot1["phone1"] ,),
                                    Cardsmallmale(content: documentSnapshot1["intro2"],target: documentSnapshot1["name2"],phone:documentSnapshot1["phone2"] ),
                                    Cardsmallmale(content: documentSnapshot1["intro3"],target: documentSnapshot1["name3"],phone:documentSnapshot1["phone3"] ),
                                  ],
                                );}
                                else{
                                  print("UGHHHHH");                                  return Text("");}
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
                            return documentSnapshot["allowed"]==true?Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(onTap: ()async{
                                int checker=0;
                                var phone=await getphone(widget.name);
                                print(phone);
                                await fire.collection("coffee").get().then((QuerySnapshot querySnapshot) => {
                                  querySnapshot.docs
                                      .forEach((doc) {
                                    if(doc["name"]==widget.name){
                                      checker=1;
                                    }
                                  })
                                });
                                if(checker==0){await fire.collection("coffee").add({
                                  "name":widget.name,
                                  "phone":phone,
                                });}

                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade, child: Coffeedate(username: widget.name,)));

                              },child: Cardconf(time:documentSnapshot["date"].toString() ,like: documentSnapshot["likes"]??3, name: documentSnapshot["target"]??"test", text: documentSnapshot["content"]??"test")),
                            ):Text("") ;
                          },
                          itemCount: 1),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            });
      },),



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
            if(index==1){
              if(widget.name!=null){
                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Confession(username: widget.name,)));

              }
            }
            if (index == 2) {
              print(widget.name);
              if (widget.name != null) {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child:ProfilePage(
                          name: widget.name,
                        )));
              } else {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: ProfilePage(name: widget.name,)));
              }
            }
          });
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
// Text(documentSnapshot["target"],
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
  Cardconf({String text, String name, int like,String time}) {
    this.like = like;
    this.text = text;
    this.name = name;
    this.time=time;
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
  padding: const EdgeInsets.all(48.0),
  child:   Image.asset("assets/images/COFFEE.png"),
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
  String phone;
  Cardsmall({String target,String content,String phone}){
    this.target=target;
    this.content=content;
    this.phone=phone;
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
            height: 140,
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
                    '@'+widget.target,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 12, 12, 0),
                  child: Container(
                      height: 50,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            widget.content,
                            style: TextStyle(fontSize: 12),
                          ))),
                ),
      GestureDetector(onTap: ()async{
        String url="https://wa.me/+91"+widget.phone;
       await launch(url);

      },
        child: Container(decoration: BoxDecoration(), width: MediaQuery.of(context).size.width / 1.5
        ,child: Padding(
          padding: const EdgeInsets.fromLTRB(190, 0, 0, 0),
          child: Row(
            children: [Text(">>>",style: TextStyle(fontSize: 20),),
              Icon(FontAwesomeIcons.whatsapp),
            ],
          ),
        ))
      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




class Cardsmallmale extends StatefulWidget {
  String target;
  String content;
  String phone;
  Cardsmallmale({String target,String content,String phone}){
    this.target=target;
    this.content=content;
    this.phone=phone;
  }

  @override
  _Cardsmallmale createState() => _Cardsmallmale();
}

class _Cardsmallmale extends State<Cardsmallmale> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          Container(
            height: 140,
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
                    '@'+widget.target,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 12, 12, 0),
                  child: Container(
                      height: 50,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            widget.content,
                            style: TextStyle(fontSize: 12),
                          ))),
                ),
                GestureDetector(onTap: (){


                },
                    child: Container(decoration: BoxDecoration(), width: MediaQuery.of(context).size.width / 1.5
                        ,child: Padding(
                          padding: const EdgeInsets.fromLTRB(130, 0, 10, 0),
                          child: Row(
                            children: [Text("Wait to get matched back",style: TextStyle(fontSize: 10),),

                            ],
                          ),
                        ))
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




















































// import 'dart:math';
//
// import 'package:casa/interest_screens/music.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// int indexofnameindoc;
// final list = <List<String>>[];
// var list2 = <List<String>>[];
// var listname = <String>[];
// final fire4 = FirebaseFirestore.instance;
// var CollectionReference4 = fire4.collection("music");
// var onecount=0;
// class Musiclist extends StatefulWidget {
//
//   String name;
//   Musiclist({String name}){
//     this.name=name;
//   }
//
//   @override
//   _MusiclistState createState() => _MusiclistState();
// }
//
// class _MusiclistState extends State<Musiclist> {
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
// getnameindex("adam");
//     prints1(indexofnameindoc);
//
//     super.initState();
//   }
//
//   Future getdocs() async {
//     await CollectionReference4.get().then((QuerySnapshot querySnapshot) => {
//           querySnapshot.docs.forEach((doc) {
//             list.add(doc["list"].cast<String>());
//           })
//         });
//     list2 = list;
//     return list2;
//   }
//
//   Future getnameindex(String name) async {
//     int count=0;
//     await CollectionReference4.get().then((QuerySnapshot querySnapshot) => {
//       querySnapshot.docs.forEach((doc) {
// if(doc["name"]==widget.name){
//   indexofnameindoc=count;
//   return count;
// }count++;
//       })
//     });
//
//   }
//
//
//   Future getname() async {
//     await CollectionReference4.get().then((QuerySnapshot querySnapshot) => {
//           querySnapshot.docs.forEach((doc) {
//             listname.add(doc["name"]);
//           })
//         });
//
//     return listname;
//   }
//
//   Future prints1(int index) async {
//     var loo = await getdocs();
//     String name = "adam";
//     var mylist = <String>[];
//     mylist = loo[indexofnameindoc];
//     mylist.sort();
//     int count = 0;
//     int count2 = 0;
//     int nameindex = 0;
//     for (int i = 0; i < loo.length; i++) {
//       if(i==indexofnameindoc){continue;}
//       count = 0;
//       for (int j = 0; j < loo[i].length && j < mylist.length; j++) {
//         list[i].sort();
//         if (list[i][j].toString() == mylist[j].toString()) {
//           count++;
//         }
//       }
//
//       if (count > count2) {
//         count2 = count;
//         nameindex = i;
//       }
//     }
//     var toprintname = await getname();
//     onecount=nameindex;
//     if(nameindex>loo.length){
//       print(toprintname[loo.length%nameindex]);
//     }
//
//
// return toprintname[nameindex];
//
//   }
//   void prints2() async {
//     String name2=" ";
//     var loo = await getdocs();
//     String name = "adam";
//     var mylist = <String>[];
//     mylist = loo[indexofnameindoc];
//     mylist.sort();
//     int count = 0;
//     int count2 = 0;
//     var toprintname;
//     int nameindex2 = 0;
//     for (int i = 0; i < loo.length; i++) {
//       count = 0;
//       if(i==onecount||i==indexofnameindoc){continue;}
//
//       for (int j = 0; j < loo[i].length && j < mylist.length; j++) {
//         list[i].sort();
//         if (list[i][j].toString() == mylist[j].toString()) {
//           count++;
//         }
//       }
//
//       if (count > count2) {
//          toprintname = await getname();
//
//          name2=toprintname[i]??"heyy";
//
//       }
//     }
//
// print(name2);
//
//
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:FutureBuilder(
//         future:prints1(indexofnameindoc),
//     builder: (BuildContext context, AsyncSnapshot snapshot){
//           return Center(child: Text(snapshot.data.toString()));
//     }
//       )
//     );
//   }
// }

Future getphone(String name)async{
  String phone;
  await fire.collection("music_match").get().then((QuerySnapshot querySnapshot) => {
    querySnapshot.docs
        .forEach((doc) {
      if(doc["name"]==name){

        phone=doc["phone"];
      }
    })
  }); return phone;
}