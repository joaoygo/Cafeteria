import 'package:flutter/material.dart';

class FloatingButtonRoundWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final String label;
  final Color color;
  const FloatingButtonRoundWidget({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: label,
      onPressed: onPressed,
      child: icon,
      backgroundColor: color,
    );
  }
}
