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
               const SizedBox(height: 200),

              // logo
              const Icon(
                Icons.shop_rounded,
                size: 100,
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'An Online Ecommerce App',
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
