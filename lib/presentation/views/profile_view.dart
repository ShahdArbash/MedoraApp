import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.profile,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
