// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:intense/UI/pages/Dashboard/StudentDashboard.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         Duration(seconds: 1),
//             () => Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => StudentDashboard()),
//             ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           color: Colors.black,
//         ),
//         child: Image.asset('assets/logos/logo.png'));
//   }
// }