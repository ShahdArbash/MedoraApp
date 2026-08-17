import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/setting&profile/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting&profile/data/service/profile_local_service.dart';
import 'package:medoraapp/features/setting&profile/data/service/profile_service.dart';
import 'package:medoraapp/features/setting&profile/logic/update_profile/update_profile_cubit.dart';
import 'package:medoraapp/features/setting&profile/presentation/view/edit_profile_view.dart';

class EditProfileScopeView extends StatelessWidget {
  final ApiClient apiClient;
  final UserProfileModel user;

  const EditProfileScopeView({
    super.key,
    required this.apiClient,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ProfileService(apiClient, ProfileLocalService()),
      child: BlocProvider(
        create: (context) => UpdateProfileCubit(context.read<ProfileService>()),
        child: EditProfileView(user: user),
      ),
    );
  }
}
