import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footware_admin/model/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Acces Database
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //The collectin brand ,price etc...
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String catogory = 'general';
  String brand = 'unbranded';
  bool offer = false;

  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProduct();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        description: productDescriptionCtrl.text,
        image: productImgCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        category: catogory,
        brand: brand,
        offer: offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar(
        "Success",
        'Product Added Sucessfully',
        colorText: Colors.green,
      );
      setValuesDefault();
    } catch (e) {
      Get.snackbar(
        "An Error has Occured",
        e.toString(),
        colorText: Colors.red,
      );
    }
  }

  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProduct = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear;
      products.assignAll(retrievedProduct);
      Get.snackbar(
        "Sucess",
        'Product feched sucessfully',
        colorText: Colors.green,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        colorText: Colors.red,
      );
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProduct();
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        colorText: Colors.red,
      );
    }
  }

  setValuesDefault() {
    productNameCtrl.clear();
    productDescriptionCtrl.clear();
    productPriceCtrl.clear();
    productImgCtrl.clear();
    catogory = 'general';
    brand = 'unbranded';
    offer = false;
    update();
  }
}
