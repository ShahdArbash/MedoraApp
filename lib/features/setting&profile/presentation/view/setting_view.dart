import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/assets.dart';
import 'package:medoraapp/features/auth/presentation/views/login_scope_view.dart';
import 'package:medoraapp/features/auth/presentation/views/login_view.dart';
import 'package:medoraapp/features/chat/chat_scope.dart';
import 'package:medoraapp/features/setting&profile/logic/Logout/logout_cubit.dart';
import 'package:medoraapp/features/setting&profile/logic/profile_cubit/profile_cubit.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/SettingView/Settings_Tile_PNG.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/MyAccont/header_title.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/SettingView/settings_header.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/SettingView/settings_switch_tile.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/SettingView/settings_tile_SVG.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';
import 'package:medoraapp/presentation/views/MyAnalysis.dart';

class SettingView extends StatelessWidget {
  final ValueChanged<int>? onTabChange;

  const SettingView({super.key, this.onTabChange});
  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => LoginScopeView(child: const LoginView()),
            ),
            (route) => false,
          );
        }

        if (state is LogoutError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.28,
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ProfileLoaded) {
                    return SettingsHeader(user: state.user);
                  }

                  if (state is ProfileError) {
                    return Center(child: Text(state.message));
                  }

                  return const SizedBox();
                },
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 20),

                  HeaderTitle(title: "الإعدادات العامة"),

                  const SizedBox(height: 20),

                  SettingsTileSVG(
                    title: 'الرئيسية',
                    icon: Assets.home,
                    onTap: () {
                      onTabChange?.call(0);
                    },
                  ),

                  const SizedBox(height: 16),

                  SettingsTileSVG(
                    title: 'تحاليلي',
                    icon: Assets.analysis,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyAnalysisView(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  SettingsTileSVG(
                    title: 'مواعيدي',
                    icon: Assets.appointment,
                    onTap: () {
                      onTabChange?.call(2);
                    },
                  ),

                  const SizedBox(height: 16),

                  SettingsTilePNG(
                    title: 'بوت الاستفسارات',
                    icon: "assets/chat_icon.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ScopeBotView()),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  HeaderTitle(title: "إعدادات التطبيق"),

                  const SizedBox(height: 24),

                  SettingsSwitchTile(
                    title: 'ثيم التطبيق',
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (val) {},
                  ),

                  const SizedBox(height: 16),

                  SettingsSwitchTile(
                    title: 'إشعارات التطبيق',
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (val) {},
                  ),

                  const SizedBox(height: 16),

                  SettingsTilePNG(
                    title: 'مركز المساعدة',
                    icon: "assets/help.png",
                    onTap: () {},
                  ),

                  const SizedBox(height: 24),

                  BlocBuilder<LogoutCubit, LogoutState>(
                    builder: (context, state) {
                      return GenericButton(
                        label: 'تسجيل الخروج',
                        onPressed: () {
                          context.read<LogoutCubit>().logout();
                        },
                        backgroundColor: Color(
                          0xFFFFDAD6,
                        ).withValues(alpha: 0.3),
                        textColor: const Color(0xFFBA1A1A),
                        height: 56,

                        hasShadow: false,
                        isLoading: state is LogoutLoading,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
