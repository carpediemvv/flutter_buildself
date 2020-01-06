import 'dart:ui';

import 'package:flutter/material.dart';

class BlurOvalWidget extends StatelessWidget {
  final Widget _widget;

  BlurOvalWidget(this._widget) {
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          color: Colors.white10,
          child: _widget,
        ),
      ),
    );
  }
}