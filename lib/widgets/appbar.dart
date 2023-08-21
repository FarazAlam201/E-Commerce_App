import 'package:e_commerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ShowAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leadingIcon;
  final String titleName;
  final IconData? actionIcon;
  final Color? iconColor;
  final VoidCallback? callback;

  ShowAppBar({
    Key? key,
    this.leadingIcon,
    this.titleName = '',
    this.actionIcon,
    // this.leadingIconSize = 24,
    //this.actionIconSize = 24,
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
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
          ),
        ],
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 9),
        child: IconButton(
          onPressed: callback,
          icon: Icon(leadingIcon),
          iconSize: 24,
          color: iconColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 11),
          child: IconButton(
            onPressed: callback,
            icon: Icon(actionIcon),
            iconSize: 24,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}
