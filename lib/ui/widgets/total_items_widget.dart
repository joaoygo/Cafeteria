import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:flutter/material.dart';

class TotalItemsWidget extends StatelessWidget {
  final VoidCallback decremente;
  final VoidCallback incremente;
  final int value;
  const TotalItemsWidget({
    Key? key,
    required this.value,
    required this.incremente,
    required this.decremente,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.08,
            height: MediaQuery.of(context).size.height * 0.04,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
                color: ColorsTheme.antique.shade700),
            child: Container(
              width: 10,
              height: 2,
              color: ColorsTheme.neutral.shade100,
            ),
          ),
          onTap: decremente,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('$value'),
        ),
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.08,
            height: MediaQuery.of(context).size.height * 0.04,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(10),
                ),
                color: ColorsTheme.antique.shade700),
            child: Text(
              '+',
              style:
                  TextStyle(color: ColorsTheme.neutral.shade100, fontSize: 20),
            ),
          ),
          onTap: incremente,
        )
      ],
    );
  }
}
