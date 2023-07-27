import 'package:flutter/material.dart';
import 'package:flutter_wonderwoman_projectscoid/gen/assets.gen.dart';

import 'button/icon_button_cpn.dart';

class AppBarCpn extends StatelessWidget with PreferredSizeWidget {
  AppBarCpn(
      {Key? key,
      this.size,
      this.child,
      this.center,
      this.right,
      this.color = Colors.transparent,
      this.bottom,
      this.iconLeft = '',
      this.left,
      this.intentResult = false})
      : super(key: key);
  final Size? size;
  final Widget? child;
  String iconLeft;
  final Widget? center;
  final Widget? right;
  final Color color;
  final Widget? bottom;
  final Widget? left;
  final bool? intentResult;

  @override
  Size get preferredSize => size ?? const Size.fromHeight(kToolbarHeight + 240);

  @override
  Widget build(BuildContext context) {
    if (iconLeft == '') {
      iconLeft = Assets.images.icBack.path;
    }
    return PreferredSize(
      preferredSize: preferredSize,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(color: color),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 24,
              bottom: 16,
              right: 24,
            ),
            child: child ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    left ??
                        IconButtonCpn(
                            path: iconLeft,
                            function: () {
                              intentResult == true
                                  ? Navigator.of(context).pop(intentResult)
                                  : Navigator.of(context).pop();
                            }),
                    center ?? const SizedBox(),
                    right ?? const SizedBox(width: 24),
                  ],
                ),
          ),
          Container(
            decoration: BoxDecoration(color: color),
            child: bottom ?? const SizedBox(),
          )
        ],
      ),
    );
  }
}
