import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/HomePage.dart';
import 'package:flutter_application_1/Views/PlantDetails.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Views/SplashScreen.dart';
import 'Widgets/productCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: HomePage(),
      home: SplashScreen(),
      //home: Details(),
    );
  }
}
