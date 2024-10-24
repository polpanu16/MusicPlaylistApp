import 'package:flutter/material.dart';
import 'package:music_playlist_app/core/resources/app_palettes.dart';

class MusicButtonShell extends StatelessWidget {
  const MusicButtonShell(
      {super.key,
      required this.child,
      required this.onTap,
      this.radius,
      this.backgroundColor,
      this.border,
      this.splashColor});
  final Widget child;
  final VoidCallback onTap;
  final double? radius;
  final Color? backgroundColor;
  final BoxBorder? border;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
            color: (backgroundColor == null)
                ? Colors.transparent
                : backgroundColor,
            border: border,
            borderRadius:
                (radius == null) ? null : BorderRadius.circular(radius!)),
        child: InkWell(
            onTap: onTap,
            borderRadius:
                (radius == null) ? null : BorderRadius.circular(radius!),
            splashColor: splashColor ?? AppPalettes.buttonSplash1,
            highlightColor: splashColor ?? AppPalettes.primary.withOpacity(0.1),
            child: child),
      ),
    );
  }
}
