import 'package:scidart/numdart.dart';
import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

import '../helpers.dart';

void main() {
  const directory = './test_files/';
  group('pie plot', () {
    test('plot simple', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 50, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));

      var line1 = PlotGeneral(ay: sg);
      var line2 = PlotGeneral(
          ay: arrayDivisionToScalar(sg, 1.5),
          plotGeneralType: PlotGeneralType.Dot,
          stroke: Color.blue);
      var line3 = PlotGeneral(
          ay: arrayDivisionToScalar(sg, 2),
          plotGeneralType: PlotGeneralType.Stem,
          stroke: Color.green);
      var line4 = PlotGeneral(
          ay: arrayDivisionToScalar(sg, 3),
          plotGeneralType: PlotGeneralType.Bar,
          stroke: Color.purple);

      var legend1 = LegendItem('line 1');
      var legend2 = LegendItem('line 2');
      var legend3 = LegendItem('line 3');
      var legend4 = LegendItem('line 4');

      var plotExample = canvasGeneral(
          ax: n,
          lines: [line1, line2, line3, line4],
          title: 'Example plot',
          legend: Legend(
              [legend1, legend2, legend3, legend4], LegendPosition.topRight));

      await saveSvg(plotExample, directory + 'plotExample');
    });
  });
}
