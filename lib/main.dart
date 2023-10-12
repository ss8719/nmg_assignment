import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.yellow,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "NMG",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
