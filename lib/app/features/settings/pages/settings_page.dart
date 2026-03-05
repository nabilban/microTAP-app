import 'package:flutter/material.dart';
import 'package:microtap/app/features/settings/widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                'Settings',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SettingsTile(
                icon: Icons.security_rounded,
                title: 'Permissions',
                subtitle: 'Overlay & Accessibility',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.language_rounded,
                title: 'Language & Translation',
                subtitle: 'English (US)',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.privacy_tip_rounded,
                title: 'Privacy Policy',
                subtitle: 'Terms & Conditions',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.info_rounded,
                title: 'About microTAP',
                subtitle: 'Version 1.0.0',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
