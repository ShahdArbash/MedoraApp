import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

class PricesView extends StatelessWidget {
  const PricesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.testPrices,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
