import 'package:flutter/material.dart';
import 'package:flutter_getx_state_managment/pages/home_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, title: 'Flutter Demo', home: HomePage());
  }
}
