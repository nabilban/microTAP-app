import 'package:flutter/material.dart';
import 'package:microtap/app/app.dart';
import 'package:microtap/app/features/overlay/pages/overlay_controller_page.dart';
import 'package:microtap/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}

@pragma('vm:entry-point')
void overlayMain() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OverlayControllerPage(),
    ),
  );
}
