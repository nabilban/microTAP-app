import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:microtap/app/features/saved/widgets/macro_card.dart';
import 'package:microtap/app/ui/colors.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Saved Macros',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainer,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.white70),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              MacroCard(
                title: 'Daily Farm Automation',
                duration: '1m 45s',
                lastRun: '2 hrs ago',
              ),
              MacroCard(
                title: 'Auto Liker Script',
                duration: '5m 00s',
                lastRun: 'Yesterday',
              ),
              MacroCard(
                title: 'Story Viewer Bot',
                duration: '45s',
                lastRun: 'Oct 12, 2023',
              ),
              MacroCard(
                title: 'App Restart Routine',
                duration: '12s',
                lastRun: 'Oct 10, 2023',
              ),
            ],
          ),
        ),
        _buildStartServiceButton(context),
      ],
    );
  }

  Widget _buildStartServiceButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: _isServiceActive
                  ? Colors.redAccent.withValues(alpha: 0.3)
                  : AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: _toggleService,
          icon: Icon(
            _isServiceActive
                ? Icons.stop_circle_rounded
                : Icons.play_circle_filled,
            color: Colors.white,
          ),
          label: Text(
            _isServiceActive ? 'Stop Service' : 'Start Service',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.surfaceContainer,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                color: _isServiceActive
                    ? Colors.redAccent.withValues(alpha: 0.5)
                    : AppColors.primary.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
