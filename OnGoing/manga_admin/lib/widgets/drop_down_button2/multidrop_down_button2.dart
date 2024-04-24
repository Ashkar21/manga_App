import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
        
        items: widget.items.map((items) {
          return DropdownMenuItem<String>(
            value: items,
            //disable default onTap to avoid closing menu when selecting an item
            onTap: () {},
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final isSelected = selectedItems.contains(items);
                return InkWell(
                  onTap: () {
                    setState(() {
                      isSelected
                          ? selectedItems.remove(items)
                          : selectedItems.add(items);
                    });
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        if (isSelected)
                          const Icon(Icons.check_box_outlined)
                        else
                          const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            items,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        value: selectedItems.isEmpty ? null : selectedItems.last,
        onChanged: (String? value) {
          setState(() {
            print(selectedItems);
            selectedItems = value?.split(', ') ?? [];
            widget.controller.text = selectedItems.join(', ');
          });
        },
        selectedItemBuilder: (context) {
          return [
            Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                selectedItems.join(', '),
                style: const TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
          ];
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(left: 16, right: 8),
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
