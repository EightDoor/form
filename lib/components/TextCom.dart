import 'package:flutter/material.dart';

/// 文本公用
class TextCom extends StatelessWidget {
  final String title;
  final TextStyle? style;
  TextCom(this.title, {this.style});
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title,
      preferBelow: false,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
}
