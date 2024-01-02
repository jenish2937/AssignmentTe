import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      this.title, {
        Key? key,
        this.textColor,
        this.fontSize,
        this.fontWeight = FontWeight.w400,
        this.textDecoration = TextDecoration.none,
        this.textAlign,
        this.fontStyle,
        this.wordSpacing,
        this.letterSpacing,
      }) : super(key: key);

  final String title;
  final Color? textColor;
  final double? fontSize;
  final double? wordSpacing;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        wordSpacing: wordSpacing,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: textColor,
        fontStyle: fontStyle,
        decoration: textDecoration,
      ),
      textAlign: textAlign,
    );
  }
}