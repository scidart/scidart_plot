import 'package:scidart/numdart.dart';
import 'package:scidart_plot/scidart_plot.dart';
import 'package:scidart_plot/src/plot/plot.dart';
import 'package:scidart_plot/src/plot/plot_line.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
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
      print(sg);

      var line = PlotLine(ay: sg);
      var plotExample = plot(ax: n, lines: [line]);

      await saveSvg(plotExample, directory + 'plotSmallSet');
    });

    test('plot big set', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 1000, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      print(sg);

      var line = PlotLine(ay: sg);
      var plotExample = plot(ax: n, lines: [line]);

      await saveSvg(plotExample, directory + 'plotBigSet');
    });

    test('plot 2 lines', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 1000, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);

      var line = PlotLine(ay: sg);
      var line2 = PlotLine(ay: sg2, color: Color.hex('#0800ff'));
      var plotExample = plot(ax: n, lines: [line, line2]);

      await saveSvg(plotExample, directory + 'plot2Lines');
    });

    test('plot 2 lines 1 dashed', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 1000, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);

      var line = PlotLine(ay: sg, strokeDasharray: StrokeDasharray.dash5);
      var line2 = PlotLine(ay: sg2, color: Color.hex('#0800ff'));
      var plotExample = plot(ax: n, lines: [line, line2]);

      await saveSvg(plotExample, directory + 'plot2Lines1Dashed');
    });

    test('plot 3 lines 2 dashed', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 1000, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);
      var sg3 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1 * 2)), 2);

      var line = PlotLine(ay: sg, strokeDasharray: StrokeDasharray.dash20);
      var line2 = PlotLine(ay: sg2, color: Color.hex('#0800ff'), strokeDasharray: StrokeDasharray.dash5);
      var line3 = PlotLine(ay: sg3, color: Color.hex('ff8c00'));
      var plotExample = plot(ax: n, lines: [line, line2, line3]);

      await saveSvg(plotExample, directory + 'plot3Lines2Dashed');
    });
  });
}
