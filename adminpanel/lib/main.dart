import 'package:adminpanel/features/home/home.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const TMLDashboard());
}

class TMLDashboard extends StatelessWidget {
  const TMLDashboard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tetris Moderno Latinoamerica Dashboard',
      home: const HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.amber,
        brightness: Brightness.dark,
      ),
    );
  }
}
