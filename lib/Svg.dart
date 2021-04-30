import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// svg使用
class SvgComponent extends StatelessWidget {
  final String url;
  final Color? color;
  final double? width;
  final double? height;
  SvgComponent({required this.url, this.color, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      url,
      color: color ?? Colors.black,
      width: width ?? 20,
      height: height ?? 20,
    );
  }
}
