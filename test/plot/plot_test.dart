import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/plot.dart';
import 'package:scidart_plot/src/plot/plot_line.dart';
import 'package:test/test.dart';

import '../helpers.dart';

void main() {
  const directory = './test_files/';
  group('plot', () {
    test('plot simple', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 50, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      print(sg);

      //https://css-tricks.com/how-to-make-charts-with-svg/
      //https://google.github.io/charts/flutter/example/line_charts/simple

      var line = PlotLine(ay: sg);
      var plotExample = plot(ax: n, lines: [line]);

      await saveSvg(plotExample, directory + 'plotSimple');
    });

    test('plot small set', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 10, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));

      var line = PlotLine(ay: sg);
      var plotExample = plot(ax: n, lines: [line]);

      await saveSvg(plotExample, directory + 'plotSmallSet');
    });

    test('plot big set', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 1000, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));

      var line = PlotLine(ay: sg);
      var plotExample = plot(ax: n, lines: [line]);

      await saveSvg(plotExample, directory + 'plotBigSet');
    });
  });
}
