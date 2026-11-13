import 'package:adminpanel/features/coaches/coach_factory.dart';
import 'package:material_ui/material_ui.dart';

class Coaches extends StatefulWidget {
  const Coaches({super.key});

  @override
  CoachesState createState() => CoachesState();
}

class CoachesState extends State<Coaches> {
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
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Center(
            child: Text("Hubo un error al intentar comunicarse con la API."),
          );
        }

        if (snapshot.hasData) {
          final coaches = snapshot.data!;

          return Padding(
            padding: EdgeInsetsGeometry.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: coaches.map((coach) {
                return Card(
                  child: Text.rich(
                    style: TextStyle(fontSize: 22),
                    TextSpan(
                      text: coach.name,
                      children: [
                        TextSpan(text: " "),
                        TextSpan(
                          text: coach.id,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }

        return Text("No data was returned.");
      },
    );
  }
}
