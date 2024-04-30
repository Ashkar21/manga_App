import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_admin/pages/home_page.dart';

// ... (other imports)

class AddChapterController extends GetxController {
  // Access Database
  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController chapternoCtrl = TextEditingController();

  Future<void> addChapter() async {
    try {
      if (nameCtrl.text.isNotEmpty && chapternoCtrl.text.isNotEmpty) {
        // Get a reference to the root folder
        final storage = FirebaseStorage.instance.ref();

        // Create a folder with the name from nameCtrl.text if it doesn't exist
        final folderRef = storage.child(nameCtrl.text);

        if ((await folderRef.listAll()).items.isEmpty) {
          // Folder does not exist, create it
          await folderRef.putData(Uint8List(0));
        }

        // Create a subfolder inside the main folder with the name from chapternoCtrl.text
        final subFolderRef = folderRef.child(chapternoCtrl.text);

        // Check if the subfolder already exists
        if ((await subFolderRef.listAll()).items.isEmpty) {
          // Subfolder does not exist, create it
          await subFolderRef.putData(Uint8List(0));
        }


        // Show success message
        Get.snackbar(
          "Success",
          'Chapter Added Successfully',
          colorText: Colors.green,
        );

        // Navigate back to HomePage
        Get.offAll(const HomePage());
        // Reset input fields
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
