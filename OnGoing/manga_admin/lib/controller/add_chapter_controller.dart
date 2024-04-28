import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_admin/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ... (other imports)

class AddChapterController extends GetxController {
  // Access Database
  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController chapternoCtrl = TextEditingController();

  Future<void> addChapter() async {
    try {
      if (nameCtrl.text.isNotEmpty && chapternoCtrl.text.isNotEmpty) {
        //!---------Createing move to the Register  a bucket----------

        // Create a folder for the chapter

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
    // Reference to the "name" collection
    final CollectionReference nameCollection = db.collection("mangalist");

    // Get documents from the "name" collection
    QuerySnapshot querySnapshot = await nameCollection.get();

    // Extract names from documents
    List<String> names = [];
    for (var doc in querySnapshot.docs) {
      names.add(doc["name"]); // Assuming the field is named "name"
    }

    return names;
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
