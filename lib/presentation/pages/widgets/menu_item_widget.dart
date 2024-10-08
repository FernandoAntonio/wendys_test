import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String displayName;

  const MenuItemWidget({
    super.key,
    required this.displayName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          displayName,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
