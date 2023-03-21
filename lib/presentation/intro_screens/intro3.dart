import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

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
                Icons.inventory,
                size: 100,
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Product Filtering and Sorting',
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