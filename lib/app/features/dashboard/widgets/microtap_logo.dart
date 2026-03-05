import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microtap/app/ui/colors.dart';

class MicroTapLogo extends StatelessWidget {
  const MicroTapLogo({
    this.size = 32,
    this.showText = true,
    super.key,
  });

  final double size;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIconBox(),
        if (showText) ...[
          const SizedBox(width: 12),
          _buildText(context),
        ],
      ],
    );
  }

  Widget _buildIconBox() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: AppColors.activeGradient,
        borderRadius: BorderRadius.circular(size * 0.25),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.5),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.touch_app_rounded,
          color: Colors.white,
          size: size * 0.6,
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => AppColors.activeGradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        'microTAP',
        style: GoogleFonts.outfit(
          fontSize: size * 0.7,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.5,
          color: Colors.white,
        ),
      ),
    );
  }
}
