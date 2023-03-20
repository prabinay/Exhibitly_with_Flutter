import 'package:exhibitly_with_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0),
            onPressed: () {},
            label: const Text(AppStrings.signUpgoogle),
          ),
        // ),
        // const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
                // text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  // TextSpan(text: tSignup, style: TextStyle(color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}
