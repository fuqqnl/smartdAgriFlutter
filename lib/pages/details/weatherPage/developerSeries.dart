import 'package:charts_flutter_new/flutter.dart' as charts;
class DeveloperSeries {
  final String time;
  final int developers;
  final charts.Color barColor;

  DeveloperSeries(
      {
        required this.time,
        required this.developers,
        required this.barColor
      }
    );
}