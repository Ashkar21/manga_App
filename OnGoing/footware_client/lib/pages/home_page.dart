import 'package:flutter/material.dart';
import 'package:footware_client/pages/product_description_page.dart';
import 'package:footware_client/widgets/dropdown_button.dart';
import 'package:footware_client/widgets/multi_select_dropdown.dart';
import 'package:footware_client/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Footware Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          //List of Catogory
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Chip(
                    label: Text('Catogory'),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Flexible(
                child: DropDownBtn(
                  items: const ['Rs : Low to High', 'Rs : High to Low'],
                  selectedItemText: 'Sort Item',
                  onSelected: (selected) {},
                ),
              ),
              //Brand Selection accouding to filtersd values
              Flexible(
                child: MultiSelectDropDown(
                  items: const ['item 1', 'item 2', 'item 3'],
                  onSelectionChanged: (selectedItems) {},
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductCard(
                  name: 'Puma',
                  imageURL:
                      'https://firebasestorage.googleapis.com/v0/b/rapid-project-e1c73.appspot.com/o/puma%201.jpeg?alt=media&token=a726b07a-daa1-421c-a733-36cb8fb59ed2',
                  offer: '20',
                  price: 1000,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductDescriptionPage(),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
