import 'package:adminpanel/features/dashboard/api_status.dart';
import 'package:material_ui/material_ui.dart';

class ApiStatusWidget extends StatefulWidget {
  const ApiStatusWidget({super.key});

  @override
  State<ApiStatusWidget> createState() => _ApiStatusWidgetState();
}

class _ApiStatusWidgetState extends State<ApiStatusWidget> {
  late Future<TMLApiStatus> _apiStatus;

  final TextStyle _apiErrorTextStyle = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );

  @override
  void initState() {
    super.initState();
    _apiStatus = getApiStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<TMLApiStatus>(
        future: _apiStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text(
              "Ocurrió un error al conectar con la API, ¿La api está offline?",
              style: _apiErrorTextStyle,
            );
          }

          final TMLApiStatus _status = snapshot.data!;

          return APIStatusCard(status: _status);
        },
      ),
    );
  }
}

class APIStatusCard extends StatelessWidget {
  final TMLApiStatus _status;

  final TextStyle _apiNormalTextStyle = TextStyle(
    color: Colors.amber,
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );

  final TextStyle _apiSubTextFontStyle = TextStyle(
    color: const Color.fromARGB(171, 255, 214, 64),
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  final TextStyle _apiStatusCodeTextStyle = TextStyle(
    color: const Color.fromARGB(143, 33, 149, 243),
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  new({super.key, required this._status});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 600,
        width: 800,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 48),
                  Text(_status.message, style: _apiNormalTextStyle, textAlign: TextAlign.center,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      spacing: 8,
                      children: [
                        Text(
                          _status.data.sensors.cpu_temp.first,
                          style: _apiSubTextFontStyle,
                        ),
                        Text(
                          _status.code.toString(),
                          style: _apiStatusCodeTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
