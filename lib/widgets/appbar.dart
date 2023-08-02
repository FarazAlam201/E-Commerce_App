import 'package:flutter/material.dart';

class ShowAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leadingIcon;
  final String titleName;
  final IconData? actionIcon;
  final Color? iconColor;
  final double? leadingIconSize;
  final double? actionIconSize;
  final VoidCallback? callback;

  const ShowAppBar({
    Key? key,
    this.leadingIcon,
    this.titleName = '',
    this.actionIcon,
    this.iconColor = const Color(0xffF6F6F6),
    this.leadingIconSize = 24,
    this.actionIconSize,
    required this.callback,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleName,
            style: const TextStyle(fontSize: 18, color: Color(0xffF6F6F6)),
          ),
        ],
      ),
      leading: IconButton(
        onPressed: callback,
        icon: Icon(leadingIcon),
        iconSize: leadingIconSize,
        color: iconColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      actions: [
        IconButton(
          onPressed: callback,
          icon: Icon(actionIcon),
          iconSize: leadingIconSize,
          color: iconColor,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      ],
    );
  }
}
