import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';
import 'package:microtap/app/features/dashboard/pages/dashboard_page.dart';
import 'package:microtap/app/ui/theme/app_theme.dart';
import 'package:microtap/l10n/l10n.dart';

/// The root application widget.
///
/// Uses AccessibilityInitializer.async to asynchronously set up WCAG-
/// compliant accessibility settings, then hands off to AccessibleMaterialApp
/// which replaces the standard MaterialApp and respects those settings.
///
/// The overlayMain entry point (declared in each flavor's main_*.dart) is a
/// separate Flutter engine entry point for the floating overlay window. It
/// uses a plain MaterialApp intentionally — it is lightweight and independent
/// of the main app's accessibility state.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AccessibilityInitializer.async(
      child: AccessibleMaterialApp(
        theme: AppTheme.darkTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const DashboardPage(),
      ),
    );
  }
}
