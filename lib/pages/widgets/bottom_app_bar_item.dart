import 'package:flutter/material.dart';

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            icon,
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11.0,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
