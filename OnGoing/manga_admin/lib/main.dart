import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_admin/controller/register_controler.dart';
import 'package:manga_admin/pages/home_page.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://paxjeolcnownpxtvcret.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBheGplb2xjbm93bnB4dHZjcmV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMyNzIyMTUsImV4cCI6MjAyODg0ODIxNX0.8sgLLekMQkY4OtzLxfhh7HZw5nXTvTvkE6u0wGo2s0g',
  );
  Get.put(RegisterController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Manga Admin',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: const Color.fromARGB(66, 255, 255, 255),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: const Color.fromARGB(66, 64, 62, 62),
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
