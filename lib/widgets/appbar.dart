import 'package:e_commerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ShowAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leadingIcon;
  final String titleName;
  final IconData? actionIcon;
  final Color? iconColor;
  final double? leadingIconSize;
  final double? actionIconSize;
  final VoidCallback? callback;

  ShowAppBar({
    Key? key,
    this.leadingIcon,
    this.titleName = '',
    this.actionIcon,
    this.leadingIconSize = 24,
    this.actionIconSize,
    required this.callback,
    Color? iconColor,
  }) : iconColor = iconColor ?? white6;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleName,
          ),
        ],
      ),
      leading: IconButton(
        onPressed: callback,
        icon: Icon(leadingIcon),
        iconSize: leadingIconSize,
        color: iconColor,
      ),
      actions: [
        IconButton(
          onPressed: callback,
          icon: Icon(actionIcon),
          iconSize: leadingIconSize,
          color: iconColor,
        ),
      ],
    );
  }
}
