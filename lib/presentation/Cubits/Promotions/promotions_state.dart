import 'package:equatable/equatable.dart';
import 'package:medoraapp/presentation/Models/promotion_model.dart';

abstract class PromotionsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PromotionsInitial extends PromotionsState {}

class PromotionsLoading extends PromotionsState {}

class PromotionsSuccessful extends PromotionsState {
  final List<PromotionModel> promotions;

  PromotionsSuccessful({required this.promotions});

  @override
  List<Object?> get props => [promotions];
}

class PromotionsFailure extends PromotionsState {
  final String message;

  PromotionsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
