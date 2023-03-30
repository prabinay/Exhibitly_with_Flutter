import 'package:exhibitly_with_flutter/presentation/intro_screens/intro1.dart';
import 'package:exhibitly_with_flutter/presentation/intro_screens/intro2.dart';
import 'package:exhibitly_with_flutter/presentation/intro_screens/intro3.dart';
import 'package:exhibitly_with_flutter/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to track of which page
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Pageview for intro pages
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          // Dot indicators
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip

                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text('Skip')),

                // dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                // next or Done
                onLastPage
                    ? GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.logIn);
                        },
                        child: const Text('Done'),
                    )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text('Next')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
