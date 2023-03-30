import 'package:exhibitly_with_flutter/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.KSecondaryColor,
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          const SizedBox(height: 100),

          // logo
          // const Icon(
          //   Icons.shop_rounded,
          //   size: 100,
          // ),

          Center(
          child: Column(
            children: <Widget>[
              // Image.asset('assets/images/output.gif',
              //     height: 200,
              //     scale: 2.5,
              //     // color: Color.fromARGB(255, 15, 147, 59),
              //     opacity:
              //         const AlwaysStoppedAnimation<double>(0.5)), //Image.asset
              Image.asset(
                'assets/images/vangogh.png',
                height: 400,
                width: 400,
              ), // Image.asset
            ], //<Widget>[]
          ), //Column
        ),

          // welcome back, you've been missed!
          Text(
            'Welcome to Exhibitly',
            style: TextStyle(
              color: ColorManager.KPrimaryColor,
              fontSize: 16,
            ),
          ),
        ],
      ))),
    );
  }
}
