import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/setting&profile/data/service/logout_service.dart';
import 'package:medoraapp/features/setting&profile/data/service/profile_local_service.dart';
import 'package:medoraapp/features/setting&profile/data/service/profile_service.dart';
import 'package:medoraapp/features/setting&profile/logic/Logout/logout_cubit.dart';
import 'package:medoraapp/features/setting&profile/logic/profile_cubit/profile_cubit.dart';
import 'package:medoraapp/features/setting&profile/logic/setting_cubit/setting_cubit.dart';
import 'package:medoraapp/features/setting&profile/logic/update_profile/update_profile_cubit.dart';
import 'package:medoraapp/features/setting&profile/presentation/view/setting_view.dart';

class SettingScopeView extends StatelessWidget {
  final ApiClient apiClient;

  const SettingScopeView({super.key, required this.apiClient});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ProfileService(apiClient, ProfileLocalService()),
      child: RepositoryProvider(
        create: (_) => LogoutService(apiClient, ProfileLocalService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<SettingCubit>(create: (_) => SettingCubit()),

            BlocProvider<ProfileCubit>(
              create: (context) =>
                  ProfileCubit(context.read<ProfileService>())..getProfile(),
            ),

            BlocProvider<UpdateProfileCubit>(
              create: (context) =>
                  UpdateProfileCubit(context.read<ProfileService>()),
            ),

            BlocProvider<LogoutCubit>(
              create: (context) => LogoutCubit(context.read<LogoutService>()),
            ),
          ],
          child: const SettingView(),
        ),
      ),
    );
  }
}
