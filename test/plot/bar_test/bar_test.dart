import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/plot.dart';
import 'package:scidart_plot/src/svg/svg.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  const directory = './test_files/';
  group('bar plot', () {
    test('bar simple', () async {
      var series = Array([5, 3, 5]);
      var line1 = PlotBar();
      var line2 = PlotBar();
      var line3 = PlotBar();

      var legend1 = LegendItem('slice 1');
      var legend2 = LegendItem('slice 2');
      var legend3 = LegendItem('slice 3');

      // var plotExample = canvasBar(series: series, pies: [line1, line2, line3],
      //     legend: Legend([legend1, legend2, legend3], LegendPosition.bottomRight));

      // await saveSvg(plotExample, directory + 'plotSimple');
    });
  });
}
