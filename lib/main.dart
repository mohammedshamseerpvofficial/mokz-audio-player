import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:mokz_player/home/home.dart';
import 'package:mokz_player/player/plyer.dart';

var gethttpList;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,

      home:home(),
    );
  }
}
