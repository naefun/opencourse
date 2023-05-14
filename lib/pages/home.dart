import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: const BoxDecoration(color: Color(0xff171717)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pick up where you left off",
              style: TextStyle(
                  color: Color(0xFFFFA500),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0xff111111),
                    borderRadius: BorderRadius.circular(22)),
                child: LayoutGrid(
                    columnSizes: [4.fr, 1.fr],
                    rowSizes: const [auto],
                    columnGap: 20,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Course title",
                            style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Lessons completed: ",
                                style: TextStyle(
                                  color: Color.fromARGB(153, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "12 / 26",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: LinearPercentIndicator(
                              animation: true,
                              lineHeight: 8.0,
                              animationDuration: 1000,
                              percent: 0.8,
                              barRadius: const Radius.circular(50),
                              progressColor: const Color(0xff49C29D),
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 0.2),
                              padding: const EdgeInsets.all(0),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.07),
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: () => log("Resume where you left off"),
                            icon: const Icon(
                              Icons.play_arrow_outlined,
                              color: Color(0xffFFA500),
                            ),
                            padding: const EdgeInsets.all(10),
                          ),
                        ),
                      )
                    ])),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Completed courses",
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
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
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(153, 255, 255, 255)),
                      axisLine: const AxisLine(color: Color(0xffffffff)),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      majorGridLines: const MajorGridLines(width: 0),
                      minorGridLines: const MinorGridLines(width: 0),
                      minorTickLines: const MinorTickLines(width: 0),
                      majorTickLines: const MajorTickLines(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                      axisLine: const AxisLine(color: Color(0xffffffff)),
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(153, 255, 255, 255)),
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
                          xValueMapper: (CompletedCourseData sales, _) =>
                              sales.month,
                          yValueMapper: (CompletedCourseData sales, _) =>
                              sales.count,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false))
                    ])),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Your courses",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => log("See all courses"),
                  child: const Text("See all",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14,
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            LayoutGrid(
              columnSizes: [1.fr, 1.fr],
              rowSizes: const [auto, auto],
              rowGap: 20,
              columnGap: 20,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: const Color(0xff111111),
                      borderRadius: BorderRadius.circular(22)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Course title",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Lessons:",
                                style: TextStyle(
                                  color: Color.fromARGB(153, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "14",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Notes:",
                                style: TextStyle(
                                  color: Color.fromARGB(153, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Lessons completed:",
                        style: TextStyle(
                          color: Color.fromARGB(153, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "2 / 14",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 8.0,
                        animationDuration: 1000,
                        percent: 0.8,
                        barRadius: const Radius.circular(50),
                        progressColor: const Color(0xff49C29D),
                        backgroundColor:
                            const Color.fromRGBO(255, 255, 255, 0.2),
                        padding: const EdgeInsets.all(0),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: const Color(0xff111111),
                      borderRadius: BorderRadius.circular(22)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      const Text(
                        "Course title",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Lessons:",
                                style: TextStyle(
                                  color: Color.fromARGB(153, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "14",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Notes:",
                                style: TextStyle(
                                  color: Color.fromARGB(153, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Lessons completed:",
                        style: TextStyle(
                          color: Color.fromARGB(153, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "2 / 14",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 8.0,
                        animationDuration: 1000,
                        percent: 0.8,
                        barRadius: const Radius.circular(50),
                        progressColor: const Color(0xff49C29D),
                        backgroundColor:
                            const Color.fromRGBO(255, 255, 255, 0.2),
                        padding: const EdgeInsets.all(0),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: const Color(0xff111111),
                      borderRadius: BorderRadius.circular(22)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      const Text(
                        "Course title",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Lessons:",
                                style: TextStyle(
                                  color: Color.fromARGB(153, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "14",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Notes:",
                                style: TextStyle(
                                  color: Color.fromARGB(153, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Lessons completed:",
                        style: TextStyle(
                          color: Color.fromARGB(153, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "2 / 14",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 8.0,
                        animationDuration: 1000,
                        percent: 0.8,
                        barRadius: const Radius.circular(50),
                        progressColor: const Color(0xff49C29D),
                        backgroundColor:
                            const Color.fromRGBO(255, 255, 255, 0.2),
                        padding: const EdgeInsets.all(0),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: const Color(0xff111111),
                      borderRadius: BorderRadius.circular(22)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      const Text(
                        "Course title",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Lessons:",
                                style: TextStyle(
                                  color: Color.fromARGB(153, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "14",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Notes:",
                                style: TextStyle(
                                  color: Color.fromARGB(153, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Lessons completed:",
                        style: TextStyle(
                          color: Color.fromARGB(153, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "2 / 14",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 8.0,
                        animationDuration: 1000,
                        percent: 0.8,
                        barRadius: const Radius.circular(50),
                        progressColor: const Color(0xff49C29D),
                        backgroundColor:
                            const Color.fromRGBO(255, 255, 255, 0.2),
                        padding: const EdgeInsets.all(0),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CompletedCourseData {
  CompletedCourseData(this.month, this.count);
  final String month;
  final double count;
}
