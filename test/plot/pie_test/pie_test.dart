import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/plot.dart';
import 'package:scidart_plot/src/svg/svg.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  const directory = './test_files/';
  group('pie plot', () {
    test('plot simple', () async {
      var series = Array([5, 3, 5]);
      var line = PlotPie();
      var plotExample = canvasPie(series: series, pies: [line]);

      await saveSvg(plotExample, directory + 'plotSimple');
    });
  });
}
