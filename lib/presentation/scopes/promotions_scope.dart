import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/presentation/Cubits/Promotions/promotions_cubit.dart';
import 'package:medoraapp/presentation/Widgets/Home_View_Widgets/promotions_slider.dart';

class PromotionsScope extends StatelessWidget {
  const PromotionsScope({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PromotionsCubit()..fetchPromotions(),
      child: const PromotionsSlider(),
    );
  }
}
