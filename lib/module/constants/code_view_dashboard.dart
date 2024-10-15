String codeRevenue = """
// Importing core libraries
import 'package:syncfusion_flutter_charts/charts.dart';

              Builder(
                builder: (context) {
                  final List<Map> chartData = [
                    {
                      "year": "Jan",
                      "sales": 4000,
                    },
                    {
                      "year": "Feb",
                      "sales": 9000,
                    },
                    {
                      "year": "Mar",
                      "sales": 3000,
                    },
                    {
                      "year": "Apr",
                      "sales": 8000,
                    },
                    {
                      "year": "May",
                      "sales": 9000,
                    }
                  ];
                  final List<Map> chartData2 = [
                    {
                      "year": "Jan",
                      "sales": 3000,
                    },
                    {
                      "year": "Feb",
                      "sales": 8000,
                    },
                    {
                      "year": "Mar",
                      "sales": 2000,
                    },
                    {
                      "year": "Apr",
                      "sales": 7000,
                    },
                    {
                      "year": "May",
                      "sales": 6000,
                    }
                  ];

                  return Container(
                    color: Theme.of(context).cardColor,
                    child: SfCartesianChart(
                      primaryXAxis: const CategoryAxis(),
                      primaryYAxis: const NumericAxis(
                        labelFormat: "{value}",
                      ),
                      legend: const Legend(
                        isVisible: true,
                        alignment: ChartAlignment.near,
                        offset: Offset(0, 0),
                      ),
                      series: <CartesianSeries>[
                        // Renders line chart
                        SplineSeries<Map, String>(
                          name: "Income",
                          color: const Color(0xff1b55e2),
                          dataSource: chartData,
                          xValueMapper: (Map data, _) => data["year"],
                          yValueMapper: (Map data, _) => data["sales"],
                        ),
                        SplineSeries<Map, String>(
                          name: "Expense",
                          color: const Color(0xffe7515a),
                          dataSource: chartData2,
                          xValueMapper: (Map data, _) => data["year"],
                          yValueMapper: (Map data, _) => data["sales"],
                        )
                      ],
                    ),
                  );
                },
              ),

""";
String codeSalesByCategory = """
// Importing core libraries
import 'package:syncfusion_flutter_charts/charts.dart';

             Builder(
                builder: (context) {
                  final List<Map> chartData = [
                    {
                      "year": "Food",
                      "sales": 40,
                    },
                    {
                      "year": "Drink",
                      "sales": 90,
                    },
                    {
                      "year": "Salt",
                      "sales": 30,
                    },
                    {
                      "year": "Sugar",
                      "sales": 80,
                    },
                    {
                      "year": "Rice",
                      "sales": 90,
                    }
                  ];

                  return Container(
                    color: Theme.of(context).cardColor,
                    child: SfCircularChart(
                      legend: const Legend(isVisible: true),
                      series: <CircularSeries>[
                        PieSeries<Map, String>(
                          dataSource: chartData,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          ),
                          xValueMapper: (Map data, _) => data["year"],
                          yValueMapper: (Map data, _) => data["sales"],
                        )
                      ],
                    ),
                  );
                },
              ),

""";

String codeDailySales = """
// Importing core libraries
import 'package:syncfusion_flutter_charts/charts.dart';
              Builder(
                builder: (context) {
                  final List<Map> chartData = [
                    {
                      "year": "Mon",
                      "sales": 40,
                    },
                    {
                      "year": "Tue",
                      "sales": 90,
                    },
                    {
                      "year": "Wed",
                      "sales": 30,
                    },
                    {
                      "year": "Thu",
                      "sales": 80,
                    },
                    {
                      "year": "Fri",
                      "sales": 90,
                    },
                    {
                      "year": "Sat",
                      "sales": 120,
                    },
                    {
                      "year": "Sun",
                      "sales": 80,
                    }
                  ];
                  return Container(
                    color: Theme.of(context).cardColor,
                    child: SfCartesianChart(
                      isTransposed: true,
                      primaryXAxis: const CategoryAxis(),
                      series: <CartesianSeries>[
                        BarSeries<Map, String>(
                          color: const Color(0xffe2a03f),
                          dataSource: chartData,
                          xValueMapper: (Map data, _) => data["year"],
                          yValueMapper: (Map data, _) => data["sales"],
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
    """;
String codeTodaySale = """
""";
