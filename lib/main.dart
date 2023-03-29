import 'package:exhibitly_with_flutter/presentation/home/home_feed.dart';
import 'package:exhibitly_with_flutter/presentation/resources/routes_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}  

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exhibitly',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.getRoute,
      // navigatorKey: navigatorKey,
      initialRoute: Routes.initialScreenRoute,
      // home: HomeFeedPage(),
    );
  }
}


