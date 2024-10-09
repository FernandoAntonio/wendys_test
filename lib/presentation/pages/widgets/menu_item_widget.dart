import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String displayName;
  final VoidCallback? onPressed;

  const MenuItemWidget({
    super.key,
    required this.displayName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Column(
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
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
