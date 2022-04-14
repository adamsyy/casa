//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:joli/screens/contactemployee.dart';
// import 'package:joli/screens/employeedashboard.dart';
//
// class EmployerDashboard extends StatefulWidget {
//
//   static String id='pay_employee_screen';
//
//   @override
//   _EmployerDashboardState createState() => _EmployerDashboardState();
// }
//
// class _EmployerDashboardState extends State<EmployerDashboard> {
//   static final FirebaseFirestore  _firestore = FirebaseFirestore.instance;
//   static final _CollectionReference = _firestore.collection("employees").doc("employeesinfo").collection("profile");
//   static final _DocumentReference = _CollectionReference.doc('profileinfo');
//
//   String name,district,profession;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//
//       child: Scaffold(
//         backgroundColor: Color(0xFFF0F1F3),
//         body: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//               children: [
//                 const SizedBox(height: 20.0),
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child:   Text("Employer Dashboard",
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 0.5,
//                         color: Color(0xFFF0F1F3),
//                       ),
//                     ),
//                   ),
//                   height: 100,
//                   width: 400,
//                   padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
//                   decoration: BoxDecoration(
//                     color: Color(0xFF172e4a),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Color(0xFF172e4a),width: 2),
//                   ),
//
//                 ),
//                 const SizedBox(height: 15.0),
//
//
//                 StreamBuilder(
//                   stream: _CollectionReference.snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: snapshot.data.docs.length,
//                           itemBuilder: (context, index) {
//                             DocumentSnapshot documentSnapshot =
//                             snapshot.data.docs[index];
//                             // String _phoneNo =documentSnapshot["phoneNo"];
//                             return Column(
//                               children: [
//
//                                 const SizedBox(height: 10.0,),
//                                 RaisedButton(
//
//                                   color: Colors.white38,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(16)),
//                                   child: Row(
//                                     children: <Widget>[
//                                       Expanded(
//                                         child: Text(documentSnapshot["Name"],style: TextStyle(color: Colors.black),),
//                                       ),
//                                       Expanded(
//                                         child: Text(documentSnapshot["PhoneNo"],style: TextStyle(color: Colors.black)),
//                                       ),
//                                       Expanded(
//                                         child: Text(documentSnapshot["District"],style: TextStyle(color: Colors.black)),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                             documentSnapshot["Profession"],style: TextStyle(color: Colors.black)),
//                                       )
//                                     ],
//                                   ),
//                                   onPressed: (){
//                                     navigateToDetail(documentSnapshot);
//                                   },
//
//                                 ),
//                               ],
//                             );
//                           });
//                     } else {
//                       return Align(
//                         alignment: FractionalOffset.bottomCenter,
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   },
//                 ),
//
//
//                 // RaisedButton(
//                 //   color: Colors.transparent,
//                 //   shape: RoundedRectangleBorder(
//                 //       borderRadius: BorderRadius.circular(16)),
//                 //   child: Text("Create"),
//                 //   textColor: Colors.white,
//                 //   onPressed: () {
//                 //
//                 //   },
//                 // ),
//               ]
//           ),
//         ),
//       ),
//     );
//   }
//   navigateToDetail( DocumentSnapshot employee) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => ContactEmployee(employee)));
//   }
//
// }