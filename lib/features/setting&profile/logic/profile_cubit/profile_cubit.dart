import 'package:bloc/bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/setting&profile/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting&profile/data/service/profile_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileService service;

  ProfileCubit(this.service) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());

    try {
      final user = await service.getProfile();

      emit(ProfileLoaded(user));
    } on ApiException catch (e) {
      emit(ProfileError(e.userMessage));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  void updateLocalProfile(UserProfileModel user) {
    emit(ProfileLoaded(user));
  }
}
