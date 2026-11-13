import 'package:material_ui/material_ui.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  const DrawerItem(this.title, this.icon);
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  static const items = [
    DrawerItem('Home', Icons.space_dashboard_outlined),
    DrawerItem('Coaches', Icons.sports_outlined),
    DrawerItem('Coaching Tickets', Icons.confirmation_number_outlined),
    DrawerItem('Students', Icons.school_outlined),
    DrawerItem('Posts', Icons.article_outlined),
  ];

  @override
  Widget build(BuildContext context) {

    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: onSelected,
      footer: Text(
        "© ShompiFlen - 2026",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade600,
          fontSize: 16,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 24, 16, 16),
          child: Text('Menú', style: TextStyle(fontSize: 36)),
        ),
        for (final item in items)
          NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title, style: TextStyle(fontSize: 18),),
          ),
      ],
    );
  }
}
