import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manga_admin/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController genreCtrl = TextEditingController();
  TextEditingController imageUrlCtrl = TextEditingController();
  TextEditingController typeCtrl = TextEditingController();

  @override
  void onInit() {
    initializeFirebase(); // Initialize Firebase in onInit()
    super.onInit();
  }

  void initializeFirebase() async {
    try {
      await Firebase.initializeApp(); // Initialize Firebase
      db = FirebaseFirestore.instance;
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
  }

  void addManga() {
    try {
      if (nameCtrl.text.isNotEmpty &&
          descriptionCtrl.text.isNotEmpty &&
          genreCtrl.text.isNotEmpty &&
          imageUrlCtrl.text.isNotEmpty &&
          typeCtrl.text.isNotEmpty) {
        final mangaData = {
          'name': nameCtrl.text,
          'description': descriptionCtrl.text,
          'genre': genreCtrl.text,
          'imageurl': imageUrlCtrl.text,
          'type': typeCtrl.text,
        };

        db.collection("mangalist").add(mangaData).then((docRef) {
          Get.snackbar(
            "Success",
            'Added Successfully',
            colorText: Colors.green,
          );
          setValuesDefault();
          Get.to(const HomePage());
        }).catchError((error) {
          Get.snackbar(
            "An Error has Occurred",
            error.toString(),
            colorText: Colors.red,
          );
        });
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

  void setValuesDefault() {
    nameCtrl.clear();
    descriptionCtrl.clear();
    genreCtrl.clear();
    imageUrlCtrl.clear();
    typeCtrl.clear();
    update();
  }
}
