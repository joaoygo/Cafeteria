import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWithItemWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const CardWithItemWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(ColorsTheme.antique.shade600),
          elevation: MaterialStateProperty.all<double>(0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: SvgPicture.asset(
                      'assets/images/${label.toLowerCase()}.svg',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      label,
                      style: TextStyle(
                        color: ColorsTheme.scarlet.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: ColorsTheme.antique.shade800,
              ),
            ],
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
