import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:microtap/app/features/macros/widgets/configuration_section.dart';
import 'package:microtap/app/features/macros/widgets/service_toggle_card.dart';
import 'package:microtap/app/features/macros/widgets/settings_input.dart';
import 'package:microtap/app/features/macros/widgets/settings_slider.dart';
import 'package:microtap/app/ui/colors.dart';

class MacrosPage extends StatefulWidget {
  const MacrosPage({super.key});

  @override
  State<MacrosPage> createState() => _MacrosPageState();
}

class _MacrosPageState extends State<MacrosPage> {
  bool _isServiceActive = false;

  Future<void> _toggleService() async {
    if (!_isServiceActive) {
      final status = await FlutterOverlayWindow.isPermissionGranted();
      if (!status) {
        await FlutterOverlayWindow.requestPermission();
        return;
      }

      await FlutterOverlayWindow.showOverlay(
        enableDrag: true,
        overlayTitle: 'microTAP Controller',
        overlayContent: 'Automation active',
        alignment: OverlayAlignment.centerLeft,
        visibility: NotificationVisibility.visibilityPublic,
        positionGravity: PositionGravity.auto,
        height: WindowSize.matchParent,
      );
    } else {
      await FlutterOverlayWindow.closeOverlay();
    }

    if (mounted) {
      setState(() => _isServiceActive = !_isServiceActive);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ServiceToggleCard(
            isActive: _isServiceActive,
            onToggle: _toggleService,
          ),
          const SizedBox(height: 24),
          Text(
            'Configuration',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ConfigurationSection(
            title: 'Gesture Settings',
            icon: Icons.touch_app,
            children: [
              SettingsSlider(
                label: 'Gesture Delay',
                value: 50,
                min: 10,
                max: 1000,
                onChanged: (v) {},
              ),
              SettingsInput(
                label: 'Gesture Repetitions',
                value: '1',
                onChanged: (v) {},
              ),
              SettingsSlider(
                label: 'Touch & Hold Delay',
                value: 1000,
                min: 100,
                max: 5000,
                onChanged: (v) {},
              ),
              SettingsSlider(
                label: 'Swipe Duration',
                value: 300,
                min: 50,
                max: 2000,
                onChanged: (v) {},
              ),
              SettingsSlider(
                label: 'Pinch Duration',
                value: 400,
                min: 50,
                max: 2000,
                onChanged: (v) {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          ConfigurationSection(
            title: 'Execution Settings',
            icon: Icons.play_circle_fill,
            children: [
              SettingsInput(
                label: 'Start Delay (seconds)',
                value: '3',
                onChanged: (v) {},
              ),
              SettingsInput(
                label: 'Script Runs',
                value: '10',
                onChanged: (v) {},
              ),
              SettingsInput(
                label: 'Loop Delay (seconds)',
                value: '1',
                onChanged: (v) {},
              ),
              const SizedBox(height: 16),
              Text(
                'Stop After Condition',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C242E),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: 'none',
                    isExpanded: true,
                    dropdownColor: AppColors.surface,
                    items: const [
                      DropdownMenuItem(
                        value: 'none',
                        child: Text('None (Run until manually stopped)'),
                      ),
                      DropdownMenuItem(
                        value: 'timer',
                        child: Text('Stop after fixed time'),
                      ),
                    ],
                    onChanged: (v) {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
