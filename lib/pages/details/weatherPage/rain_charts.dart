import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

import 'developerSeries.dart';

class RainCharts extends StatelessWidget {
  List<DeveloperSeries> data;

  RainCharts(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperSeries series, _) => series.time,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (DeveloperSeries series, _) => series.barColor
      )
    ];

    return charts.BarChart(
      series,
      animate: true,
      defaultRenderer: charts.BarRendererConfig(
        fillPattern: charts.FillPatternType.solid,
      ),
    );
  }
}


