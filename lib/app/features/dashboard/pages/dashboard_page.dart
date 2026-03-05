import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microtap/app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:microtap/app/features/dashboard/widgets/microtap_logo.dart';
import 'package:microtap/app/features/macros/pages/macros_page.dart';
import 'package:microtap/app/features/saved/pages/saved_page.dart';
import 'package:microtap/app/features/settings/pages/settings_page.dart';
import 'package:microtap/app/ui/colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  static const List<Widget> _pages = [
    MacrosPage(),
    SavedPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedIndex = context.watch<DashboardCubit>().state.selectedIndex;

    return Scaffold(
      appBar: AppBar(
        title: const MicroTapLogo(size: 28),
        centerTitle: false,
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white10),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: context.read<DashboardCubit>().selectTab,
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: theme.colorScheme.onSurfaceVariant,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'Macros',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_rounded),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
