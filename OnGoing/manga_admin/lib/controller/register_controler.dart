import 'package:flutter/material.dart';
import 'package:manga_admin/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Access Database
  final SupabaseClient supabase = Supabase.instance.client;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController genreCtrl = TextEditingController();
  TextEditingController imageUrlCtrl = TextEditingController();
  TextEditingController typeCtrl = TextEditingController();



  addManga() async {
    try {
      if (nameCtrl.text.isNotEmpty &&
          descriptionCtrl.text.isNotEmpty &&
          genreCtrl.text.isNotEmpty &&
          imageUrlCtrl.text.isNotEmpty &&
          typeCtrl.text.isNotEmpty) {
        //! Create a bucket
        await supabase.storage.createBucket((nameCtrl.text).toLowerCase());

        // Insert data into the 'mangalist' table
        await supabase.from('mangalist').insert({
          'name': nameCtrl.text,
          'description': descriptionCtrl.text,
          'genre': genreCtrl.text,
          'imageurl': imageUrlCtrl.text,
          'type': typeCtrl.text,
        });

        Get.snackbar(
          "Success",
          'Added Successfully',
          colorText: Colors.green,
        );

        setValuesDefault();
        Get.to(const HomePage());
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

  setValuesDefault() {
    nameCtrl.clear();
    descriptionCtrl.clear();
    genreCtrl.clear();
    imageUrlCtrl.clear();
    typeCtrl.clear();
    update();
  }
}
