import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_custom_app_bar.dart';

class AppBaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? trailing;

  const AppBaseScreen({
    super.key,
    required this.title,
    required this.body,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppCustomAppBar(title: title, trailing: trailing),

        body: Column(
          children: [
            const Divider(),

            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
