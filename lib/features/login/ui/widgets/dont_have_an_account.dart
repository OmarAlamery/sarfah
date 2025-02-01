import 'package:flutter/material.dart';
import 'package:sarfah/core/theming/fonts.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",
            style: FontHelper.font13WhiteW300),
        TextButton(
          child: Text("Sign Up"),
          onPressed: () {},
        )
      ],
    );
  }
}
