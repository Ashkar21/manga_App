// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class FoodBuyController extends GetxController {
//   // Access Database
//   final SupabaseClient supabase = Supabase.instance.client;

//   Future<List<DataRow>> fetch() async {
//     final data = await supabase.from('register').select('foodname,mealtype,quantity,date,phone');

//     return List<DataRow>.generate(
//       data.length,
//       (index) => DataRow(
//         cells: [
//           DataCell(
//             Text(data[index]['foodname'].toString()),
//           ),
//           DataCell(
//             Text(data[index]['mealtype'].toString()),
//           ),
//           DataCell(
//             Text(data[index]['quantity'].toString()),
//           ),
//           DataCell(
//             Text(data[index]['date'].toString()),
//           ),
//           DataCell(
//             Text(data[index]['phone'].toString()),
//           ),
//         ],
//       ),
//     );
//   }
// }
