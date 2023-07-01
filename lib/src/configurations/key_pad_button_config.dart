import 'package:flutter/material.dart';

class KeyPadButtonConfig {
  KeyPadButtonConfig(
      {double? size,
      double? fontSize,
      double? actionFontSize,
      this.foregroundColor,
      this.backgroundColor,
      this.side,
      this.buttonStyle,
      this.child})
      : size = size ?? 68,
        fontSize = fontSize ?? 36;

  Widget? child;

  /// Button width and height.
  final double size;

  /// Button font size.
  final double fontSize;

  /// Button foreground (text) color.
  final Color? foregroundColor;

  /// Button background color.
  final Color? backgroundColor;

  /// Base [ButtonStyle] that is overridden by other specified values.
  final ButtonStyle? buttonStyle;

  final MaterialStateProperty<BorderSide?>? side;

  /// Returns this config as a [ButtonStyle].
  ButtonStyle toButtonStyle() {
    ButtonStyle composed = OutlinedButton.styleFrom(
      textStyle: TextStyle(
        fontSize: fontSize,
        overflow: TextOverflow.fade,
      ),
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
    );
    if (buttonStyle != null) {
      return buttonStyle!.copyWith(
        textStyle: composed.textStyle,
        foregroundColor: composed.foregroundColor,
        backgroundColor: composed.backgroundColor,
        side:side
      );
    } else {
      return composed;
    }
  }

  /// Copies a [KeyPadButtonConfig] with new values.
  KeyPadButtonConfig copyWith(
      {double? size,
      double? fontSize,
      Color? foregroundColor,
      Color? backgroundColor,
      ButtonStyle? buttonStyle,
      Widget? child}) {
    return KeyPadButtonConfig(
        size: size ?? this.size,
        fontSize: fontSize ?? this.fontSize,
        foregroundColor: foregroundColor ?? this.foregroundColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        buttonStyle: buttonStyle ?? this.buttonStyle,
        child: child);
  }
}
