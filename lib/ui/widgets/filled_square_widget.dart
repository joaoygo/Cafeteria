import 'package:cafeteira_ygo/core/common/constants/assets_constants.dart';
import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilledSquareWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final bool outlined;
  const FilledSquareWidget(
      {Key? key, required this.onPressed, required this.outlined})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SvgPicture.asset(
            AssetsConstants.squareOutlined,
            width: MediaQuery.of(context).size.height * 0.03,
            height: MediaQuery.of(context).size.height * 0.03,
            color: outlined ? ColorsTheme.antique.shade700 : null,
          ),
          !outlined
              ? Positioned(
                  left: 5,
                  top: 5,
                  right: 3.5,
                  bottom: 3.5,
                  child: Container(
                    width: 20,
                    height: 20,
                    color: ColorsTheme.antique.shade700,
                  ),
                )
              : const SizedBox(
                  child: null,
                ),
        ],
      ),
      onTap: onPressed,
    );
  }
}
