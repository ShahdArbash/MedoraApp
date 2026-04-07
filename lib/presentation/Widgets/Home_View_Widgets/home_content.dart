import 'package:flutter/material.dart';
import 'package:medoraapp/constants/static_data.dart';
import '../../scopes/promotions_scope.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          /// Promotions Cubit Scope
          const PromotionsScope(),

          const SizedBox(height: 16),

          Row(children: getListServices(context)),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
