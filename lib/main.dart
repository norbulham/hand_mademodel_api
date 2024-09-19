import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hand_mademodel_api/page/user_page.dart';
import 'package:hand_mademodel_api/page/wallpaper_detail.dart';
import 'package:hand_mademodel_api/page/wallpaper_page.dart';
import 'package:hand_mademodel_api/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WallpaperPage(),
    );
  }
}