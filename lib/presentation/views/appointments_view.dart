import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.appointments,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
