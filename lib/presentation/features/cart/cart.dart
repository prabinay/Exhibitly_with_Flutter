import 'package:exhibitly_with_flutter/presentation/features/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/products.dart';
import 'cart_total.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.find();

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        
        height: 600,
        child: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (BuildContext context, int index) {
            return CartProductCard(
              controller: controller,
              product: controller.products.keys.toList()[index],
              quantity: controller.products.values.toList()[index],
              index: index,
            );
          },
        ),
        
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.index,
      required this.product,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              product.img,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(product.name)),
          IconButton(
              onPressed: () {
                controller.removeProducts(product);
              },
              icon: Icon(Icons.remove_circle)),
          Text('$quantity'),
          IconButton(
              onPressed: () {
                controller.addProducts(product);
              },
              icon: Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}
