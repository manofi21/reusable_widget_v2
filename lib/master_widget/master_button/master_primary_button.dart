// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'master_elevated_button.dart';

class MasterPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? callback;
  final bool isDisabled;
  final bool isLoading;
  final Color? loadingColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;
  final bool wrapWidth;
  final double? height;
  final String? buttonIdentifier;
  const MasterPrimaryButton({
    Key? key,
    required this.text,
    this.callback,
    this.isDisabled = false,
    this.isLoading = false, this.loadingColor, this.fontSize,
    this.fontWeight,
    this.wrapWidth = false,
    this.height,
    this.buttonIdentifier,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wrapWidth ? null : double.infinity,
      height: height ?? 56,
      child: !isDisabled
          ? ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pink)),
              onPressed: isDisabled ? null : () {},
              child: !isLoading
                  ? Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: fontWeight ?? FontWeight.w700,
                          fontSize: fontSize ?? 16),
                    )
                  : CircularProgressIndicator(
                      strokeWidth: 1,
                      color: loadingColor ?? Colors.white,
                    ),
            )
          : MasterElevatedButton(
              width: double.infinity,
              onPressed: isDisabled ? null : () {},
              borderRadius: BorderRadius.circular(8),
              child: !isLoading
                  ? Text(
                      text,
                      style: TextStyle(
                          fontWeight: fontWeight ?? FontWeight.w700,
                          fontSize: fontSize ?? 16),
                    )
                  : CircularProgressIndicator(
                      strokeWidth: 1,
                      color: loadingColor ?? Colors.white,
                    ),
            ),
    );
  }
}

Widget primaryButton(BuildContext context, String text, VoidCallback? callback,
    {bool isDisabled = false,
    bool isLoading = false,
    Color? loadingColor,
    double? fontSize,
    FontWeight? fontWeight,
    double? radius,
    bool wrapWidth = false,
    double? height,
    String? buttonIdentifier}) {
  return SizedBox(
    width: wrapWidth ? null : double.infinity,
    height: height ?? 56,
    child: isDisabled
        ? ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: isDisabled ? null : () {},
            child: !isLoading
                ? Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: fontWeight ?? FontWeight.w700,
                        fontSize: fontSize ?? 16),
                  )
                : CircularProgressIndicator(
                    strokeWidth: 1,
                    color: loadingColor ?? Colors.white,
                  ),
          )
        : MasterElevatedButton(
            width: double.infinity,
            onPressed: isDisabled ? null : () {},
            borderRadius: BorderRadius.circular(8),
            child: !isLoading
                ? Text(
                    text,
                    style: TextStyle(
                        fontWeight: fontWeight ?? FontWeight.w700,
                        fontSize: fontSize ?? 16),
                  )
                : CircularProgressIndicator(
                    strokeWidth: 1,
                    color: loadingColor ?? Colors.white,
                  ),
          ),
  );
}
