// import 'package:flutter/material.dart';
// import 'package:foodwaste_managment/pages/home_page.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:get/get.dart';

// class HomeController extends GetxController {
//   // Access Database
//   final SupabaseClient supabase = Supabase.instance.client;

//   TextEditingController foodNameCtrl = TextEditingController();
//   TextEditingController mealTypeCtrl = TextEditingController();
//   TextEditingController categoryCtrl = TextEditingController();
//   TextEditingController quantityCtrl = TextEditingController();
//   TextEditingController dateCtrl = TextEditingController();
//   TextEditingController emailCtrl = TextEditingController();
//   TextEditingController phoneCtrl = TextEditingController();

//   addProduct() async {
//     try {
//       if (foodNameCtrl.text.isNotEmpty &&
//           mealTypeCtrl.text.isNotEmpty &&
//           categoryCtrl.text.isNotEmpty &&
//           quantityCtrl.text.isNotEmpty &&
//           emailCtrl.text.isNotEmpty &&
//           phoneCtrl.text.isNotEmpty &&
//           dateCtrl.text.isNotEmpty) {
//         await supabase.from('register').insert({
//           'foodname': foodNameCtrl.text,
//           'mealtype': mealTypeCtrl.text,
//           'catogory': categoryCtrl.text,
//           'quantity': quantityCtrl.text,
//           'date': dateCtrl.text,
//           'email': emailCtrl.text,
//           'phone': phoneCtrl.text,
//         });
//         Get.snackbar(
//           "Success",
//           ' Added Successfully',
//           colorText: Colors.green,
//         );
//         setValuesDefault();
//         Get.to(const HomePage());
//       } else {
//         Get.snackbar(
//           "An Error has Occurred",
//           'Fill all the Field',
//           colorText: Colors.red,
//         );
//       }
//     } catch (e) {
//       Get.snackbar(
//         "An Error has Occurred",
//         e.toString(),
//         colorText: Colors.red,
//       );
//     }
//   }

//   setValuesDefault() {
//     foodNameCtrl.clear();
//     mealTypeCtrl.clear();
//     categoryCtrl.clear();
//     quantityCtrl.clear();
//     dateCtrl.clear();
//     emailCtrl.clear();
//     phoneCtrl.clear();
//     update();
//   }
// }
