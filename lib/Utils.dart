import 'package:flutter/material.dart';

class MyTextStyle extends Text {
  MyTextStyle(
    String data, {
    this.color = 0xFF333333,
    this.backgroundColor = 0xFFFFFFFF,
    this.fontSize = 10,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  }) : super(data);

  final int color;
  final int backgroundColor;
  final double fontSize;
  final int maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: Color(color),
        fontSize: fontSize,
        backgroundColor: Color(backgroundColor),
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
