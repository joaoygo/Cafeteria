import 'package:flutter/material.dart';

import '../../core/common/themes/colors_theme.dart';

class FloatingButtonPrimaryWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const FloatingButtonPrimaryWidget({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: label,
      onPressed: onPressed,
      label: Text(label),
      backgroundColor: ColorsTheme.antique.shade700,
      extendedPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
    );
  }
}
