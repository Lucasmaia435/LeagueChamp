import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'League Dictionary',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Search for League's Champions by name.",
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 16,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
