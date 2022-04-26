import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/common/constants/assets_constants.dart';

class ChangeSizeCoffe extends StatelessWidget {
  final VoidCallback onPressed;
  final String avatar;
  final double sizeIcon;
  final bool outlined;
  const ChangeSizeCoffe({
    Key? key,
    required this.onPressed,
    required this.avatar,
    this.sizeIcon = 20,
    required this.outlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            outlined
                ? '${AssetsConstants.baseAssets}${avatar}_outlined.svg'
                : '${AssetsConstants.baseAssets}$avatar.svg',
            width: sizeIcon,
            color: outlined ? ColorsTheme.antique.shade700 : null,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Container(
              width: 14,
              height: 2,
              decoration: BoxDecoration(
                  color: !outlined ? ColorsTheme.antique.shade700 : null,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ],
      ),
      onTap: onPressed,
    );
  }
}
