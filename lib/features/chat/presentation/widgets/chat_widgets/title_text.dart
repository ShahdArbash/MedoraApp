import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

import '../../../../../constants/colors.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.aiAssistantTitle,
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,

        shadows: [
          Shadow(offset: Offset(1, 1), color: Colors.black),
          Shadow(offset: Offset(-1, 1), color: Colors.black),
          Shadow(offset: Offset(1, -1), color: Colors.black),
          Shadow(offset: Offset(-1, -1), color: Colors.black),
        ],
        color: AppColors.primaryColorChat,
      ),
      textAlign: TextAlign.center,
    );
  }
}
