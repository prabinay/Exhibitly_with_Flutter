import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: ColorManager.KSecondaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
               const SizedBox(height: 200),

              // logo
              const Icon(
                Icons.add_shopping_cart,
                size: 100,
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Buy arts easy and cheap',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
            ],
          )
        )),
    );
  }
}