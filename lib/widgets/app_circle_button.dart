import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton({
    super.key,
    required this.child,
    this.color,
    this.onTap,
    this.width = 60,
  });

  final Widget child;
  final Color? color;
  final double width;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      // 材料类型改为透明，否则就会为白色背景
      type: MaterialType.transparency,
      // 裁剪
      clipBehavior: Clip.hardEdge,
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
