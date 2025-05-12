import 'package:flutter/material.dart';

import '../../../bottom_nav_bar/bottom_nav_bar.dart';

class FullfilmentCenterListViewBody extends StatelessWidget {
  final void Function()? onTap;
  final Color borderColor;
  final String name;
  final String line1;
  final void Function()? onDoubleTap;
  const FullfilmentCenterListViewBody({
    super.key,
    this.onTap,
    required this.borderColor,
    required this.name,
    required this.line1,
    this.onDoubleTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap:
          onDoubleTap ??
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
            );
          },
      child: AnimatedContainer(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              line1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
