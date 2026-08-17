import 'package:flutter/material.dart';
import 'package:medoraapp/constants/assets.dart';
import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/analysis/presentation/view/AnalysisCardView/analysis_list_scope_view.dart';
import 'package:medoraapp/features/appointments/presentation/views/Appointments_scope_view.dart';
import 'package:medoraapp/features/setting&profile/presentation/view/setting_scope_view.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/main_bottom_nav_bar.dart';
import 'package:medoraapp/presentation/Widgets/Home_View_Widgets/home_app_bar%20.dart';
import 'package:medoraapp/presentation/Widgets/Home_View_Widgets/home_content.dart';

import '../../features/chat/chat_scope.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  List<Widget> get pages => [
    const HomeContent(),
    const AnalysisListScopeView(),
    const AppointmentsScopeView(),
    SettingScopeView(apiClient: ApiClient()),
  ];
  void goToHomeTab() {
    _pageController.jumpToPage(0);
    setState(() {
      _currentIndex = 0;
    });
  }

  void onNavTap(int index) {
    /// إذا كان زر الشات
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ScopeBotView()),
      );
      return;
    }

    _pageController.jumpToPage(index);

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? HomeAppBar(
              userName: 'شهد عربش',
              profileImage: Assets.profile,
              isOnline: true,
            )
          : null,

      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: MedicalBottomNavBar(
          currentIndex: _currentIndex,
          onTap: onNavTap,
        ),
      ),
    );
  }
}
