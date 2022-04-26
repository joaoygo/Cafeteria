import 'package:cafeteira_ygo/core/common/constants/assets_constants.dart';
import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquareWithLineOutlinedWidget extends StatelessWidget {
  final MaterialColor color;
  final VoidCallback onPressed;
  final bool isSelect;
  const SquareWithLineOutlinedWidget({
    Key? key,
    this.color = ColorsTheme.antique,
    required this.onPressed,
    required this.isSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SvgPicture.asset(
                AssetsConstants.squareOutlined,
                width: MediaQuery.of(context).size.height * 0.03,
                height: MediaQuery.of(context).size.height * 0.03,
                color: color.shade700,
              ),
              SvgPicture.asset(
                AssetsConstants.diagonalLineOutlined,
                width: MediaQuery.of(context).size.height * 0.03,
                height: MediaQuery.of(context).size.height * 0.03,
                color: isSelect ? ColorsTheme.antique.shade700 : color.shade700,
              ),
            ],
          ),
        ],
      ),
      onTap: onPressed,
    );
  }
}
