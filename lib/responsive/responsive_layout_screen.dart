import 'package:flutter/material.dart';
import 'package:insta/utils/dimension.dart';

class LayOut extends StatelessWidget {
  const LayOut({super.key, required this.webView, required this.mobileView});
  final Widget webView;
  final Widget mobileView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenView) {
          return webView;
        } else {
          return mobileView;
        }
      },
    );
  }
}
