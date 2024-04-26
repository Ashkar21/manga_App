import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_admin/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddChapterController extends GetxController {
  // Access Database
  final SupabaseClient supabase = Supabase.instance.client;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController chapternoCtrl = TextEditingController();

  addChapter() async {
    try {
      if (nameCtrl.text.isNotEmpty && chapternoCtrl.text.isNotEmpty) {
        await supabase.storage
            .createBucket(nameCtrl.text, const BucketOptions(public: true));

        Get.snackbar(
          "Success",
          'Bucket and Folder Created Successfully',
          colorText: Colors.green,
        );

        Get.to(const HomePage());
        setValuesDefault(); // Move this line here
      } else {
        Get.snackbar(
          "An Error has Occurred",
          'Fill all the Field',
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

  setValuesDefault() {
    nameCtrl.clear();
    chapternoCtrl.clear();
    update();
  }
}
