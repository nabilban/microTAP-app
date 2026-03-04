import 'package:microtap/app/app.dart';
import 'package:microtap/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
