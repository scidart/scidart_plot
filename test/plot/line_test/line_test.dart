import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/plot.dart';
import 'package:scidart_plot/src/svg/svg.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  const directory = './test_files/';
  group('line plot', () {
    test('plot simple', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 50, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      print(sg);

      //https://css-tricks.com/how-to-make-charts-with-svg/
      //https://google.github.io/charts/flutter/example/line_charts/simple

      var line = PlotLine(ay: sg);
      var plotExample = canvasLine(ax: n, lines: [line]);

      await saveSvg(plotExample, directory + 'plotSimple');
    });

    test('plot small set', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 10, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      print(sg);

      var line = PlotLine(ay: sg);
      var plotExample = canvasLine(ax: n, lines: [line]);

      await saveSvg(plotExample, directory + 'plotSmallSet');
    });

    test('plot big set', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 1000, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      print(sg);

      var line = PlotLine(ay: sg);
      var plotExample = canvasLine(ax: n, lines: [line]);

      await saveSvg(plotExample, directory + 'plotBigSet');
    });

    test('plot 2 lines', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 1000, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);

      var line = PlotLine(ay: sg);
      var line2 = PlotLine(ay: sg2, color: Color.blue);
      var plotExample = canvasLine(ax: n, lines: [line, line2]);

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
      var plotExample = canvasLine(ax: n, lines: [line, line2]);

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
      var line2 = PlotLine(ay: sg2, color: Color.blue, strokeDasharray: StrokeDasharray.dash5);
      var line3 = PlotLine(ay: sg3, color: Color.orange);
      var plotExample = canvasLine(ax: n, lines: [line, line2, line3]);

      await saveSvg(plotExample, directory + 'plot3Lines2Dashed');
    });
  });

  test('plot 3 lines 2 dashed background', () async {
    var N = 0.1;
    var n = linspace(0, N, num: 1000, endpoint: false);
    var f1 = 60.0;
    var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
    var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);
    var sg3 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1 * 2)), 2);

    var line = PlotLine(ay: sg, strokeDasharray: StrokeDasharray.dash5dash1);
    var line2 = PlotLine(ay: sg2, color: Color.blue, strokeDasharray: StrokeDasharray.dash5);
    var line3 = PlotLine(ay: sg3, color: Color.orange);
    var plotExample = canvasLine(ax: n, backgroundColor: Color.white, lines: [line, line2, line3]);

    await saveSvg(plotExample, directory + 'plot3Lines2DashedBackground');
  });

  test('plot with title', () async {
    var N = 0.1;
    var n = linspace(0, N, num: 50, endpoint: false);
    var f1 = 60.0;
    var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));

    var line = PlotLine(ay: sg);
    var plotExample = canvasLine(ax: n, title: 'Test Plot', lines: [line]);

    await saveSvg(plotExample, directory + 'plotWithTitle');
  });

  test('plot 3 lines 2 dashed Legend top left', () async {
    var N = 0.1;
    var n = linspace(0, N, num: 1000, endpoint: false);
    var f1 = 60.0;
    var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
    var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);
    var sg3 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1 * 2)), 2);

    var line = PlotLine(ay: sg, strokeDasharray: StrokeDasharray.dash5dash1);
    var line2 = PlotLine(ay: sg2, color: Color.blue, strokeDasharray: StrokeDasharray.dash5);
    var line3 = PlotLine(ay: sg3, color: Color.orange);

    var legend1 = LegendItem('line 1');
    var legend2 = LegendItem('line 2');
    var legend3 = LegendItem('line 3');

    var plotExample = canvasLine(ax: n, lines: [line, line2, line3],
        legend: Legend([legend1, legend2, legend3], LegendPosition.topLeft));

    await saveSvg(plotExample, directory + 'plot3Lines2DashedLegendTopLeft');
  });

  test('plot 3 lines 2 dashed Legend top right', () async {
    var N = 0.1;
    var n = linspace(0, N, num: 1000, endpoint: false);
    var f1 = 60.0;
    var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
    var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);
    var sg3 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1 * 2)), 2);

    var line = PlotLine(ay: sg, strokeDasharray: StrokeDasharray.dash5dash1);
    var line2 = PlotLine(ay: sg2, color: Color.blue, strokeDasharray: StrokeDasharray.dash5);
    var line3 = PlotLine(ay: sg3, color: Color.orange);

    var legend1 = LegendItem('line 1');
    var legend2 = LegendItem('line 2');
    var legend3 = LegendItem('line 3');

    var plotExample = canvasLine(ax: n, lines: [line, line2, line3],
        legend: Legend([legend1, legend2, legend3], LegendPosition.topRight));

    await saveSvg(plotExample, directory + 'plot3Lines2DashedLegendTopRight');
  });

  test('plot 3 lines 2 dashed Legend bottom left', () async {
    var N = 0.1;
    var n = linspace(0, N, num: 1000, endpoint: false);
    var f1 = 60.0;
    var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
    var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);
    var sg3 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1 * 2)), 2);

    var line = PlotLine(ay: sg, strokeDasharray: StrokeDasharray.dash5dash1);
    var line2 = PlotLine(ay: sg2, color: Color.blue, strokeDasharray: StrokeDasharray.dash5);
    var line3 = PlotLine(ay: sg3, color: Color.orange);

    var legend1 = LegendItem('line 1');
    var legend2 = LegendItem('line 2');
    var legend3 = LegendItem('line 3');

    var plotExample = canvasLine(ax: n, lines: [line, line2, line3],
        legend: Legend([legend1, legend2, legend3], LegendPosition.bottomLeft));

    await saveSvg(plotExample, directory + 'plot3Lines2DashedLegendBottomLeft');
  });

  test('plot 3 lines 2 dashed Legend bottom right', () async {
    var N = 0.1;
    var n = linspace(0, N, num: 1000, endpoint: false);
    var f1 = 60.0;
    var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
    var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);
    var sg3 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1 * 2)), 2);

    var line = PlotLine(ay: sg, strokeDasharray: StrokeDasharray.dash5dash1);
    var line2 = PlotLine(ay: sg2, color: Color.blue, strokeDasharray: StrokeDasharray.dash5);
    var line3 = PlotLine(ay: sg3, color: Color.orange);

    var legend1 = LegendItem('line 1');
    var legend2 = LegendItem('line 2');
    var legend3 = LegendItem('line 3');

    var plotExample = canvasLine(ax: n, lines: [line, line2, line3],
        legend: Legend([legend1, legend2, legend3], LegendPosition.bottomRight));

    await saveSvg(plotExample, directory + 'plot3Lines2DashedLegendBottomRight');
  });

  test('plot 3 lines 2 dashed Legend center', () async {
    var N = 0.1;
    var n = linspace(0, N, num: 1000, endpoint: false);
    var f1 = 60.0;
    var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
    var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);
    var sg3 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1 * 2)), 2);

    var line = PlotLine(ay: sg, strokeDasharray: StrokeDasharray.dash5dash1);
    var line2 = PlotLine(ay: sg2, color: Color.blue, strokeDasharray: StrokeDasharray.dash5);
    var line3 = PlotLine(ay: sg3, color: Color.orange);

    var legend1 = LegendItem('line 1');
    var legend2 = LegendItem('line 2');
    var legend3 = LegendItem('line 3');

    var plotExample = canvasLine(ax: n, lines: [line, line2, line3],
        legend: Legend([legend1, legend2, legend3], LegendPosition.center));

    await saveSvg(plotExample, directory + 'plot3Lines2DashedLegendCenter');
  });

  test('plot 3 lines 2 dashed Legend top right big text title', () async {
    var N = 0.1;
    var n = linspace(0, N, num: 1000, endpoint: false);
    var f1 = 60.0;
    var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
    var sg2 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);
    var sg3 = arrayDivisionToScalar(arraySin(arrayMultiplyToScalar(n, 2 * pi * f1 * 2)), 2);

    var line = PlotLine(ay: sg, strokeDasharray: StrokeDasharray.dash5dash1);
    var line2 = PlotLine(ay: sg2, color: Color.blue, strokeDasharray: StrokeDasharray.dash5);
    var line3 = PlotLine(ay: sg3, color: Color.orange);

    var legend1 = LegendItem('Bacon ipsum dolor amet meatloaf porchetta beef');
    var legend2 = LegendItem('line 2');
    var legend3 = LegendItem('line 3');

    var plotExample = canvasLine(ax: n, lines: [line, line2, line3],
        title: 'bresaola shankle rump cupim',
        legend: Legend([legend1, legend2, legend3], LegendPosition.topRight));

    await saveSvg(plotExample, directory + 'plot3Lines2DashedLegendTopRightBigTextTitle');
  });
}
