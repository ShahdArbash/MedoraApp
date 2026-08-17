import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/setting&profile/data/model/update_profile_request.dart';
import 'package:medoraapp/features/setting&profile/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting&profile/data/service/profile_service.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ProfileService service;

  UpdateProfileCubit(this.service) : super(UpdateProfileInitial());

  Future<void> updateProfile(UpdateProfileRequest request) async {
    emit(UpdateProfileLoading());

    try {
      final user = await service.updateProfile(request);

      emit(UpdateProfileSuccess(user));
    } on ApiException catch (e) {
      emit(UpdateProfileError(e.userMessage));
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }
}
