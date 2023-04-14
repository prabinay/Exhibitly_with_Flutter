

import 'package:exhibitly_with_flutter/presentation/services/firebase_db.dart';
import 'package:get/get.dart';

import '../models/products.dart';

class ProductController extends GetxController{
  // add list of product objects
  final products = <Product>[].obs;

  @override
  void onInit(){
    products.bindStream(FirestoreDb().getAllProducts());
    super.onInit();
  }
}