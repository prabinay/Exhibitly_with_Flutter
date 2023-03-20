import 'package:exhibitly_with_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image(
            // image: const AssetImage(tWelcomeScreenImage),
            // height: size.height * 0.2),
        Text(AppStrings.welcomeBack, ),
        Text(AppStrings.introScreenText1, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
