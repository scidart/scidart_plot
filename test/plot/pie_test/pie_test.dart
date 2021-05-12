import 'package:scidart/numdart.dart';
import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  const directory = './test_files/';
  group('pie plot', () {
    test('plot simple', () async {
      var series = Array([5, 3, 5]);
      var line1 = PlotPie(fill: Color.blue);
      var line2 = PlotPie(fill: Color.red);
      var line3 = PlotPie(fill: Color.green);

      var legend1 = LegendItem('slice 1');
      var legend2 = LegendItem('slice 2');
      var legend3 = LegendItem('slice 3');

      var plotExample = canvasPie(
          series: series,
          pies: [line1, line2, line3],
          legend:
              Legend([legend1, legend2, legend3], LegendPosition.bottomRight));

      await saveSvg(plotExample, directory + 'plotSimple');
    });

    test('plot slice custom', () async {
      var series = Array([2, 3, 5]);
      var line1 = PlotPie(
          fill: Color.blue,
          stroke: Color.black,
          strokeWidth: StrokeWidth.width5,
          strokeDasharray: StrokeDasharray.dash2);
      var line2 = PlotPie(fill: Color.red);
      var line3 = PlotPie(fill: Color.green);

      var legend1 = LegendItem('slice 1');
      var legend2 = LegendItem('slice 2');
      var legend3 = LegendItem('slice 3');

      var plotExample = canvasPie(
          title: 'some title to test',
          series: series,
          pies: [line1, line2, line3],
          legend:
              Legend([legend1, legend2, legend3], LegendPosition.bottomRight));

      await saveSvg(plotExample, directory + 'plotSliceCustom');
    });
  });
}
