import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysisSelectionCubit extends Cubit<int> {
  AnalysisSelectionCubit() : super(-1);

  void toggle(int index) {
    if (state == index) {
      emit(-1); // إلغاء التحديد
    } else {
      emit(index); // تحديد عنصر جديد
    }
  }
}
