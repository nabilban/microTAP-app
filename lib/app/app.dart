import 'package:flutter/material.dart';
import 'package:microtap/app/features/dashboard/pages/dashboard_page.dart';
import 'package:microtap/app/ui/theme/app_theme.dart';
import 'package:microtap/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const DashboardPage(),
    );
  }
}
