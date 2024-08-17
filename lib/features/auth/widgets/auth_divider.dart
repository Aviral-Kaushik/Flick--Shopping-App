import 'package:flutter/material.dart';

class AuthDividerWidget extends StatelessWidget {
  const AuthDividerWidget({super.key, required this.showDividerForLoginScreen});

  final bool showDividerForLoginScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        const Expanded(
            child: Divider(color: Colors.grey,
                thickness: 1, height: 100)),

        const SizedBox(width: 6,),

        Text(
          showDividerForLoginScreen ? "Or Login with" : "Or Register with",
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 6,),

        const Expanded(
            child: Divider(color: Colors.grey,
                thickness: 1, height: 100)),
      ],
    );
  }
}
