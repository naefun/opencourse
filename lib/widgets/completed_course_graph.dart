import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CompletedCoursesLineGraph extends StatelessWidget {
  const CompletedCoursesLineGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xff111111),
            borderRadius: BorderRadius.circular(22)),
        child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            plotAreaBorderColor: const Color(0x00ffffff),
            tooltipBehavior: TooltipBehavior(
              enable: true,
            ),
            primaryXAxis: CategoryAxis(
              labelStyle:
                  const TextStyle(color: Color.fromARGB(153, 255, 255, 255)),
              axisLine: const AxisLine(color: Color(0xffffffff)),
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              majorGridLines: const MajorGridLines(width: 0),
              minorGridLines: const MinorGridLines(width: 0),
              minorTickLines: const MinorTickLines(width: 0),
              majorTickLines: const MajorTickLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              axisLine: const AxisLine(color: Color(0xffffffff)),
              labelStyle:
                  const TextStyle(color: Color.fromARGB(153, 255, 255, 255)),
              majorGridLines: const MajorGridLines(width: 0),
              minorGridLines: const MinorGridLines(width: 0),
              minorTickLines: const MinorTickLines(width: 0),
              majorTickLines: const MajorTickLines(width: 0),
            ),
            legend: Legend(isVisible: false),
            series: <LineSeries<CompletedCourseData, String>>[
              LineSeries<CompletedCourseData, String>(
                  animationDuration: 1000,
                  color: const Color(0xff49C29D),
                  dataSource: <CompletedCourseData>[
                    CompletedCourseData('Jan', 0),
                    CompletedCourseData('Feb', 2),
                    CompletedCourseData('Mar', 5),
                    CompletedCourseData('Apr', 8),
                    CompletedCourseData('May', 9)
                  ],
                  xValueMapper: (CompletedCourseData sales, _) => sales.month,
                  yValueMapper: (CompletedCourseData sales, _) => sales.count,
                  dataLabelSettings: const DataLabelSettings(isVisible: false))
            ]));
  }
}

class CompletedCourseData {
  CompletedCourseData(this.month, this.count);
  final String month;
  final double count;
}
