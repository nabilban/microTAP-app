import 'package:flutter/material.dart';
import 'package:microtap/app/features/dashboard/widgets/macro_card.dart';
import 'package:microtap/app/ui/colors.dart';

class SavedSection extends StatelessWidget {
  const SavedSection({super.key});

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
                decoration: BoxDecoration(
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
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.play_circle_filled, color: Colors.white),
          label: const Text(
            'Start Service',
            style: TextStyle(
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
                color: AppColors.primary.withOpacity(0.5),
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
