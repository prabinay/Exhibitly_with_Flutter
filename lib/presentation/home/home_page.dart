import 'package:exhibitly_with_flutter/presentation/features/cart/cart.dart';
import 'package:exhibitly_with_flutter/presentation/features/profile/profile_details.dart';
import 'package:exhibitly_with_flutter/presentation/features/search/search.dart';
import 'package:exhibitly_with_flutter/presentation/home/products_home.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../widgets/custom_text.dart';
import 'home_feed.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    // HomeFeedPage(),
    HomeProducts(),
    CartPage(),
    // const SearchProducts(),
    // const SizedBox(),
    const ProfileDetails(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   title: Text(
      //     "Exhibitly",
      //     style: TextStyle(
      //         fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
      //   ),
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: ColorManager.KPrimaryColor,
      //   automaticallyImplyLeading: false,
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  // color: Colors.grey[500],
                ),
                label: "",
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: "",
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "",
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorManager.KSecondaryColor,
          // selectedItemColor: Colors.orange,

          unselectedItemColor: Colors.grey[500],
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: ColorManager.KPrimaryColor,
          iconSize: 26,
          elevation: 5),
    );
  }
}
