import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  final String name;
  final dynamic price;
  final String img;

  const Product({
    required this.name,
    required this.price,
    required this.img,
  });


  static Product fromSnapshot(DocumentSnapshot snap){
    Product product = Product(
      name: snap['product-name'],
      price: snap['product-price'],
      img: snap['product-img'],
    );
    return product;
  }

  // static const List<Product> products = [
  //   Product(
  //     name: 'Starry Night',
  //     price: 2.88,
  //     img: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1280px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg',
  //   ),
  //   Product(
  //     name: 'Starry Nighst',
  //     price: 5.54,
  //     img: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1280px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg',
  //   ),
  //   Product(
  //     name: 'Starry s',
  //     price: 88.88,
  //     img: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1280px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg',
  //   )
  // ];

}