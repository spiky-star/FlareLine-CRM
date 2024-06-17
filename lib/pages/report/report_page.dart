import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_crm/pages/crm_layout.dart';
import 'package:flareline_uikit/components/charts/circular_chart.dart';
import 'package:flareline_uikit/components/charts/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ReportPage extends CrmLayout {
  const ReportPage({super.key});

  @override
  // TODO: implement backgroundColor
  Color? get backgroundColor => Colors.white;

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Reports';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: LineChartWidget(
            isDropdownToggle: false,
            title: 'Sales Figures',
            dropdownItems: const ['Daily', 'Weekly', 'Monthly'],
            datas: const [
              {
                'name': 'Marketing Sales',
                'color': Color(0xFFFE8111),
                'data': [
                  {'x': 'Jan', 'y': 25},
                  {'x': 'Fed', 'y': 75},
                  {'x': 'Mar', 'y': 28},
                  {'x': 'Apr', 'y': 32},
                  {'x': 'May', 'y': 40},
                  {'x': 'Jun', 'y': 48},
                  {'x': 'Jul', 'y': 44},
                  {'x': 'Aug', 'y': 42},
                  {'x': 'Sep', 'y': 70},
                  {'x': 'Oct', 'y': 65},
                  {'x': 'Nov', 'y': 55},
                  {'x': 'Dec', 'y': 78}
                ]
              },
              {
                'name': 'Cases Sales',
                'color': Color(0xFF01B7F9),
                'data': [
                  {'x': 'Jan', 'y': 70},
                  {'x': 'Fed', 'y': 30},
                  {'x': 'Mar', 'y': 66},
                  {'x': 'Apr', 'y': 44},
                  {'x': 'May', 'y': 55},
                  {'x': 'Jun', 'y': 51},
                  {'x': 'Jul', 'y': 44},
                  {'x': 'Aug', 'y': 30},
                  {'x': 'Sep', 'y': 100},
                  {'x': 'Oct', 'y': 87},
                  {'x': 'Nov', 'y': 77},
                  {'x': 'Dec', 'y': 20}
                ]
              },
            ],
          ),
        ),
        SizedBox(
          height: 500,
          child: Row(
            children: [
              SizedBox(
                width: 500,
                child: CircularhartWidget(
                  title: 'Sorce Of Purchases',
                  position: LegendPosition.bottom,
                  orientation: LegendItemOrientation.vertical,
                  palette: const [
                    CrmColors.orange,
                    CrmColors.secondary,
                  ],
                  chartData: const [
                    {
                      'x': 'Social Media',
                      'y': 33,
                    },
                    {
                      'x': 'Direct Search',
                      'y': 33,
                    },
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(child: _buildTrackerBarChart())
            ],
          ),
        )
      ],
    );
  }

  SfCartesianChart _buildTrackerBarChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Working hours of employees'),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          title: AxisTitle(text: 'Hours'),
          minimum: 0,
          maximum: 8,
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getTrackerBarSeries(),
    );
  }

  /// Returns the lsit of chart series
  /// which need to render on the bar chart with trackers.
  List<BarSeries<ChartSampleData, String>> _getTrackerBarSeries() {
    return <BarSeries<ChartSampleData, String>>[
      BarSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'United States', y: 7.5),
          ChartSampleData(x: 'Indonesia', y: 7),
          ChartSampleData(x: 'France', y: 6),
          ChartSampleData(x: 'Japan', y: 5),
          ChartSampleData(x: 'China', y: 7),
        ],
        // borderRadius: BorderRadius.circular(15),
        trackColor: Colors.transparent,

        /// If we enable this property as true,
        /// then we can show the track of series.
        isTrackVisible: true,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelAlignment: ChartDataLabelAlignment.top,
        ),
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
    ];
  }
}

class ChartSampleData {
  final String x;
  final double y;

  ChartSampleData({required this.x, required this.y});
}
