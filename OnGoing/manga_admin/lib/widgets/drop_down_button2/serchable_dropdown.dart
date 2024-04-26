import 'package:flutter/material.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';

class SearchableDropDownBtn extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Future<dynamic> items; // Change List<String> to Future<dynamic>

  const SearchableDropDownBtn({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.items,
  }) : super(key: key);

  @override
  State<SearchableDropDownBtn> createState() => _SearchableDropDownBtnState();
}

class _SearchableDropDownBtnState extends State<SearchableDropDownBtn> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: widget.items,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Handle loading state
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error state
          return Text('Error loading data');
        } else {
          // Data is available
          final List<String> itemList = snapshot.data as List<String>;

          return SearchableDropdown<int>(
            hintText: Text(widget.hintText),
            margin: const EdgeInsets.all(15),
            items: List.generate(
              itemList.length,
              (i) => SearchableDropdownMenuItem(
                value: i,
                child: Text(itemList[i]),
                label: '',
              ),
            ),
            onChanged: (int? value) {
              setState(() {
                widget.controller.text = itemList[value ?? 0];
                print(widget.controller.text);
              });
            },
          );
        }
      },
    );
  }
}
