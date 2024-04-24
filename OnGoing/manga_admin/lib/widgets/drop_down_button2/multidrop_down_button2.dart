import 'package:flutter/material.dart';
import 'package:multiselect_dropdown_pro/multiselect_dropdown_pro.dart';

class MulitDrop2 extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final List<String> items;

  const MulitDrop2({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.items,
  }) : super(key: key);

  @override
  State<MulitDrop2> createState() => _MulitDrop2State();
}

class _MulitDrop2State extends State<MulitDrop2> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown(
      title: 'Select Options',
      items: widget.items,
      onChanged: (String? selectedItems) {
        print('Selected Items: $selectedItems');
        if (selectedItems != null) {
          setState(() {
            widget.controller.text = selectedItems;
          });
        }
      },
      value: '', // Initial selected values
      hint: 'Select options',
      primaryColor: Colors.white, // Customize primary color
      suffixIcon: Icons.arrow_drop_down, // Customize suffix icon
      separator: ',', // Customize separator
    );
  }
}
