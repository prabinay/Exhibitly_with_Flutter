import 'package:get/get.dart';

import '../../../../models/products.dart';

class CartController extends GetxController {
  // Add a dict to store the products in cart
  var _products = {}.obs;

  void addProducts(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      "Product Added",
      "You have added the ${product.name} to the cart",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 1),
    );
  }

  void removeProducts(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
    Get.snackbar(
      "Product Removed",
      "You have removed the ${product.name} from the cart",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 1),
    );
  }

  // get Products
  get products => _products;

  // get producst Subtotal
  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value).toList();

  // get Total
    get total => _products.entries
      .map((product) => product.key.price * product.value).toList()
      .reduce((value, element) => value + element).toStringAsFixed(2);

}
