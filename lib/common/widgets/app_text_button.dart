import 'package:flutter/material.dart';

import '../styles/app_themes.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.text,
    this.onTap,
    this.isOutlineButton = false,
    this.color,
    this.textColor,
    this.buttonWidth = 344,
    this.onLoading = false,
  }) : super(key: key);
  final String text;
  final Function? onTap;
  final bool onLoading;
  final bool isOutlineButton;
  final Color? color;
  final Color? textColor;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: 52,
      child: isOutlineButton
          ? OutlinedButton(
              style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide(color: color ?? AppThemes.primary))),
              onPressed: () {
                if (onTap != null) {
                  onTap!();
                }
              },
              child:
                  // onLoading
                  //     ? const Loading()
                  //     :
                  Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: textColor ?? AppThemes.black),
                ),
              ))
          : TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
              ),
              onPressed: () {
                if (onTap != null) {
                  onTap!();
                }
              },
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: textColor == null
                      ? Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppThemes.white)
                      : Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: textColor),
                ),
              ),
            ),
    );
  }
}
