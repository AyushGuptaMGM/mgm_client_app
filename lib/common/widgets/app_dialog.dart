import 'package:flutter/material.dart';

import '../styles/app_themes.dart';
import '../utils/arch_utils/widgets/spacing_widgets.dart';
import 'app_text_button.dart';

class AppDialog extends StatelessWidget {
  AppDialog(
      {Key? key,
      required this.message,
      required this.buttonTitle,
      required this.onButtonTap})
      : super(key: key);

  String message;
  String buttonTitle;
  Function onButtonTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            VSpace(40),
            AppTextButton(
              text: buttonTitle,
              isOutlineButton: true,
              onTap: onButtonTap,
              color: AppThemes.transparent,
            )
          ],
        ),
      ),
    );
  }
}
