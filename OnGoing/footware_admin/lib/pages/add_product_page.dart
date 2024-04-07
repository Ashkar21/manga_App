import 'package:flutter/material.dart';
import 'package:footware_admin/controller/home_controller.dart';
import 'package:footware_admin/widgets/dropdown_button.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Product'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Add New Products
                  const Text(
                    'Add New Product',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 15),
                  //Product Name
                  TextField(
                    controller: ctrl.productNameCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text('Product Name'),
                      hintText: "Enter The Product Name",
                    ),
                  ),
                  const SizedBox(height: 15),
                  //Description
                  TextField(
                    controller: ctrl.productDescriptionCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text('Description'),
                      hintText: "Enter The Product Description",
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 15),
                  //Image URL
                  TextField(
                    controller: ctrl.productImgCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text('Image URL'),
                      hintText: "Enter The Image URL",
                    ),
                  ),
                  const SizedBox(height: 15),
                  //Price
                  TextField(
                    controller: ctrl.productPriceCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text('Product Price'),
                      hintText: "Enter The Product Price",
                    ),
                  ),
                  const SizedBox(height: 15),
                  //DropDown Button of Catogory And Brand
                  Row(
                    children: [
                      //Catogory
                      Flexible(
                        child: DropDownBtn(
                          items: const [
                            'Boots',
                            'Shoe',
                            'Beach Shoes',
                            'High Heels'
                          ],
                          selectedItemText: ctrl.catogory,
                          onSelected: (selectedValue) {
                            ctrl.catogory = selectedValue ?? 'general';
                            ctrl.update();
                          },
                        ),
                      ),
                      //Brand
                      Flexible(
                        child: DropDownBtn(
                          items: const [
                            'Puma',
                            'Sketchers',
                            'Adidas',
                            'Clarks',
                          ],
                          selectedItemText: ctrl.brand,
                          onSelected: (selectedValue) {
                            ctrl.brand = selectedValue ?? 'Unbranded';
                            ctrl.update();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  //Offer Product
                  const Text('Offer Product ?'),
                  const SizedBox(height: 5),
                  DropDownBtn(
                    items: const ['true', 'false'],
                    selectedItemText: ctrl.offer.toString(),
                    onSelected: (selectedValue) {
                      ctrl.offer =
                          bool.tryParse(selectedValue ?? 'false') ?? false;
                      ctrl.update();
                    },
                  ),
                  const SizedBox(height: 15),
                  //Add Product Button
                  ElevatedButton(
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      'Add Product',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
