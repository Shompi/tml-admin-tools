import 'package:adminpanel/features/coaches/coach_card.dart';
import 'package:adminpanel/features/coaches/coach_factory.dart';
import 'package:material_ui/material_ui.dart';

class Coaches extends StatefulWidget {
  const Coaches({super.key});

  @override
  State<Coaches> createState() => _CoachesState();
}

class _CoachesState extends State<Coaches> {
  late Future<List<Coach>> _coaches;

  @override
  void initState() {
    super.initState();

    _coaches = getCoaches();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _coaches,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text("Hubo un error al intentar comunicarse con la API."),
          );
        }

        if (snapshot.hasData) {
          final coaches = snapshot.data!;

          return SingleChildScrollView(
            padding: EdgeInsetsDirectional.only(start: 24, top: 12, end: 32),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [for (final coach in coaches) CoachCard(coach: coach)],
            ),
          );
        }
        return Center(child: Text("No data was returned."));
      },
    );
  }
}
