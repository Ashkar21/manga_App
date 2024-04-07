import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footware_client/models/user/user.dart';
import 'package:footware_client/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();

  OtpFieldControllerV2 otpController = OtpFieldControllerV2();

  bool otpFieldShow = false;

  int? otpSend;
  int? otpEntered;

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }

// Add users OR registeration
  addUser() {
    try {
      if (otpSend == otpEntered) {
        if (registerNameCtrl.text.isEmpty || registerNumberCtrl.text.isEmpty) {
          Get.snackbar(
            "Plese Enter The Field",
            'Error',
            colorText: Colors.red,
          );
          //? to stop the code
          return;
        }
        DocumentReference doc = userCollection.doc();
        User product = User(
          id: doc.id,
          name: registerNameCtrl.text,
          number: int.parse(registerNumberCtrl.text),
        );
        final userJson = product.toJson();
        doc.set(userJson);
        Get.snackbar(
          "Success",
          'User Added Sucessfully',
          colorText: Colors.green,
        );
        registerNumberCtrl.clear();
        registerNameCtrl.clear();
        otpController.clear();
        Get.to(const HomePage());
      } else {
        Get.snackbar(
          "Wrong OTP Entered",
          'Error',
          colorText: Colors.red,
        );
        otpController.clear();
      }
    } catch (e) {
      Get.snackbar(
        "An Error has Occured",
        e.toString(),
        colorText: Colors.red,
      );
    }
  }

// Sending otp
  sendOtp() async {
    try {
      if (registerNameCtrl.text.isEmpty || registerNumberCtrl.text.isEmpty) {
        Get.snackbar(
          "Plese Enter The Field",
          'Error',
          colorText: Colors.red,
        );
        //? to stop the code
        return;
      }
      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      // String mobilenumber = registerNumberCtrl.text;
      // String url = 'URL HERE';
      // Response response = await GetConnect().get(url);

      print('-----------------------------$otp---------------------------');

      //We will send otp and check if ists send sucessfull or not
      // ignore: unnecessary_null_comparison
      if (otp != null) {
        //if(response.body['message][0] == 'Sms.send sucessfuly')
        otpFieldShow = true;
        otpSend = otp;
        Get.snackbar(
          "OTP Sucessful Send",
          'Sucess',
          colorText: Colors.green,
        );
      } else {
        Get.snackbar(
          "An Error has Occured",
          'OTP Not Send',
          colorText: Colors.red,
        );
      }
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }
}
