import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_king_client/pages/description_page.dart';
import 'package:manga_king_client/pages/home_page.dart';
import 'package:manga_king_client/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegisterPage(),
    );
  }
}
