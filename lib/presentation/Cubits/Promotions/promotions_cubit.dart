import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/presentation/Cubits/Promotions/promotions_state.dart';
import 'package:medoraapp/presentation/Models/promotion_model.dart';
import 'package:medoraapp/constants/assets.dart';

class PromotionsCubit extends Cubit<PromotionsState> {
  PromotionsCubit() : super(PromotionsInitial());

  Future<void> fetchPromotions() async {
    if (isClosed) return;
    emit(PromotionsLoading());

    await Future.delayed(const Duration(seconds: 2));

    // بيانات ثابتة بدون l10n
    final promotions = [
      PromotionModel(
        image: Assets.test1,
        title: "عرض الصيف", // نص عربي مؤقت
        description: "احصل على خصم 50% على كل المنتجات!",
      ),
      PromotionModel(
        image: Assets.test3,
        title: "عرض نهاية الأسبوع",
        description: "تخفيضات مذهلة لفترة محدودة!",
      ),
      PromotionModel(
        image: Assets.test4,
        title: "منتج جديد",
        description: "جرب منتجنا الجديد الآن!",
      ),
    ];
    if (isClosed) return;
    emit(PromotionsSuccessful(promotions: promotions));
  }
}
