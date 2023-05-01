import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:exhibitly_with_flutter/controllers/product_controller.dart';
import 'package:exhibitly_with_flutter/presentation/features/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/color_manager.dart';

class HomeProducts extends StatefulWidget {
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  HomeProducts({Key? key}) : super(key: key);

  @override
  State<HomeProducts> createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    // return Flexible(
    // child: ListView.builder(
    //     // padding: EdgeInsets.only(top: 10),
    //     itemCount: Product.products.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return HomeProductsCard(index: index);
    //     }),
    // );

    return Obx(
      () => Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,

            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "Exhibitly",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            elevation: 0,
            centerTitle: true,
            backgroundColor: ColorManager.KPrimaryColor,
            automaticallyImplyLeading: false,
          ),

          // padding: EdgeInsets.only(top: 10),
          body: GridView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemCount: productController.products.length,
              itemBuilder: (BuildContext context, int index) {
                return HomeProductsCard(index: index);
              })),
    );
  }
}

class HomeProductsCard extends StatelessWidget {
  final int index;
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();

  HomeProductsCard({Key? key, required this.index}) : super(key: key);

  List<String> _carouselImages = [];

  var _dotPosition = 0;

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        // MaterialPageRoute(
        // builder: (BuildContext context) =>
        // ProductDetailScreen(
        //   index: index
        // ,
        // ),
        // ),
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.KSecondaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              spreadRadius: 2,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  )
                ],
              ),
              SizedBox(height: 10),
              AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                      padding: const EdgeInsets.only(bottom: 110),
                      // color: Colors.yellow,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            productController.products[index].img,
                          ),
                        ),
                      ))),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productController.products[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                      Row(
                        children: [
                          Text(
                            "Nrs."
                            '${productController.products[index].price.toString()}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),

                          // Text(
                          //   "Nrs."
                          //   '${Product.products[index].price}',
                          //   style: TextStyle(
                          //     fontSize: 12,
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.black.withOpacity(0.4),
                          //   ),
                          // ),

                          IconButton(
                            padding: EdgeInsets.only(left: 40),
                            onPressed: () {
                              cartController.addProducts(
                                  productController.products[index]);
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
