import 'package:adminpanel/shared/customdrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const _pages = <Widget>[
    // Reemplazar esto cuando tenga las otras vistas creadas
    Center(child: Text('Coaches')),
    Center(child: Text('Coaching Tickets')),
    Center(child: Text('Students')),
    Center(child: Text('Posts')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
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
