import 'package:flutter/material.dart';
import '../../utils/constant.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
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
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kCultured,
          ),
        ),
      ),
      child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 10.0,
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 15.0,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 3.0,
                ),
              ),
            ],
          ),
          selected: false,
          onTap: onTap),
    );
  }
}
