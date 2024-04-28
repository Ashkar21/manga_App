import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_admin/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ... (other imports)

class AddChapterController extends GetxController {
  // Access Database
  final SupabaseClient supabase = Supabase.instance.client;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController chapternoCtrl = TextEditingController();

  Future<void> addChapter() async {
    try {
      if (nameCtrl.text.isNotEmpty && chapternoCtrl.text.isNotEmpty) {
        //!---------Createing move to the Register  a bucket----------
        

        // Create a folder for the chapter
        final chapterNumber = chapternoCtrl.text;
        final folderPath = '${nameCtrl.text}/chapter$chapterNumber/';
        await supabase.storage.createBucket(folderPath);

        Get.snackbar(
          "Success",
          'Bucket and Folder Created Successfully',
          colorText: Colors.green,
        );

        Get.to(const HomePage());
        setValuesDefault();
      } else {
        Get.snackbar(
          "An Error has Occurred",
          'Fill all the Fields',
          colorText: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        "An Error has Occurred",
        e.toString(),
        colorText: Colors.red,
      );
    }
  }

  //Read the data Of List

  Future<List<String>> fetchName() async {
    try {
      final response = await supabase.from('mangalist').select('name');

      final List<dynamic> dataList = response;
      final List<String> data =
          dataList.map((e) => e['name'] as String).toList();

      return data;
    } catch (e) {
      Get.snackbar(
        "An Error has Occurred",
        e.toString(),
        colorText: Colors.red,
      );
      return []; // Return an empty list in case of error
    }
  }

  // Clear Values
  void setValuesDefault() {
    nameCtrl.clear();
    chapternoCtrl.clear();
    update();
  }
}
