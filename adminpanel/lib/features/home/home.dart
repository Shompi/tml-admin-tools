import 'package:adminpanel/features/coaches/coaches.dart';
import 'package:adminpanel/features/dashboard/dashboard.dart';
import 'package:adminpanel/shared/customdrawer.dart';
import 'package:material_ui/material_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const _pages = <Widget>[
    // Reemplazar esto cuando tenga las otras vistas creadas
    Dashboard(),
    Coaches(),
    Center(child: Text('Coaching Tickets (NOT IMPLEMENTED)')),
    Center(child: Text('Students (NOT IMPLEMENTED)')),
    Center(child: Text('Posts (NOT IMPLEMENTED)')),
  ];

  static const _pageTitles = <Text>[
    Text("Dashboard"),
    Text("Coaches"),
    Text("Tickets de Coaching"),
    Text("Estudiantes"),
    Text("Posts de la Página")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _pageTitles[_selectedIndex],),
      drawer: AppDrawer(
        selectedIndex: _selectedIndex,
        onSelected: (i) {
          setState(() => _selectedIndex = i);
          Navigator.pop(context); // cierra el drawer
        },
      ),
      body: _pages[_selectedIndex],
    );
  }
}
