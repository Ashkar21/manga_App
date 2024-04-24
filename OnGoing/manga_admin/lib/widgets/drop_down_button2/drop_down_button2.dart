import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Drop2DownButton extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final List<String> genderItems;

  const Drop2DownButton({
    Key? key,
    required this.genderItems,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  _Drop2DownButtonState createState() => _Drop2DownButtonState();
}

class _Drop2DownButtonState extends State<Drop2DownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          widget.hintText,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: widget.genderItems
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
            widget.controller.text = selectedValue ?? '';
          });
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
