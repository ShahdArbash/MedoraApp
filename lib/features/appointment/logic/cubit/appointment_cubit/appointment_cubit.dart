import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/appointment/data/repository/appointment_repository.dart';
import 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepository repo;

  AppointmentCubit(this.repo) : super(AppointmentInitial());

  Future<void> loadTimes({
    required int labId,
    required int analysisId,
    required String date,
  }) async {
    emit(AppointmentLoading());

    try {
      final times = await repo.getTimes(
        labId: labId,
        analysisId: analysisId,
        date: date,
      );

      emit(AppointmentLoaded(times));
    } catch (e) {
      emit(AppointmentError("فشل تحميل الأوقات"));
    }
  }
}
