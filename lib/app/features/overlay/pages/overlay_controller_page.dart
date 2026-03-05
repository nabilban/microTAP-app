import 'package:flutter/material.dart';
import 'package:microtap/app/ui/colors.dart';

class OverlayControllerPage extends StatefulWidget {
  const OverlayControllerPage({super.key});

  @override
  State<OverlayControllerPage> createState() => _OverlayControllerPageState();
}

class _OverlayControllerPageState extends State<OverlayControllerPage> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStatusBar(),
              const SizedBox(height: 12),
              _buildActionBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: _isVisible ? 0 : 20),
      child: Container(
        height: 48,
        width: 280,
        decoration: BoxDecoration(
          color: const Color(
            0xB30B1015,
          ), // Semi-transparent AppColors.background
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(Icons.repeat_rounded, size: 16, color: Colors.white70),
            const SizedBox(width: 8),
            const Text(
              'Rep: 05/10',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: VerticalDivider(
                color: Colors.white10,
                indent: 14,
                endIndent: 14,
              ),
            ),
            const Icon(Icons.timer_rounded, size: 16, color: Colors.white70),
            const SizedBox(width: 8),
            const Text(
              '00:12:45',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => setState(() => _isVisible = !_isVisible),
              icon: Icon(
                _isVisible
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                size: 18,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildActionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xE60B1015), // Darker AppColors.background
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildActionButton(Icons.add_rounded, Colors.greenAccent),
          _buildActionButton(Icons.remove_rounded, Colors.redAccent),
          const SizedBox(width: 8),
          const VerticalDivider(color: Colors.white10, indent: 8, endIndent: 8),
          const SizedBox(width: 8),
          _buildActionButton(
            Icons.radio_button_checked_rounded,
            Colors.redAccent,
            isLarge: true,
          ),
          _buildActionButton(Icons.stop_rounded, Colors.white, isLarge: true),
          _buildActionButton(
            Icons.play_arrow_rounded,
            AppColors.primary,
            isLarge: true,
          ),
          const SizedBox(width: 8),
          const VerticalDivider(color: Colors.white10, indent: 8, endIndent: 8),
          const SizedBox(width: 8),
          _buildActionButton(Icons.settings_rounded, Colors.white70),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    Color color, {
    bool isLarge = false,
  }) {
    return Container(
      width: isLarge ? 52 : 44,
      height: isLarge ? 52 : 44,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: isLarge ? 28 : 22,
        ),
      ),
    );
  }
}
