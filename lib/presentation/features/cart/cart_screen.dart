import 'package:exhibitly_with_flutter/presentation/features/cart/cart.dart';
import 'package:exhibitly_with_flutter/presentation/features/cart/cart_total.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,

        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "My Cart",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorManager.KPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartPage(),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}
