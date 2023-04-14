import 'package:exhibitly_with_flutter/presentation/home/products_home.dart';
import 'package:exhibitly_with_flutter/presentation/resources/routes_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/features/cart/controller/cart_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Exhibitly',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.getRoute,
      // navigatorKey: navigatorKey,
      initialRoute: Routes.initialScreenRoute,
      // home: HomeProducts(),
    );
  }
}
