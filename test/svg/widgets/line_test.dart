import 'package:scidart_plot/scidart_plot.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a Line', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Line(
          x1: 0,
          y1: 0,
          x2: 100,
          y2: 100,
          stroke: Color.rgb(10, 200, 39),
        )
      ]);

      await saveSvg(svg, directory + 'lineSvg');
    });

    test('Create a Line', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Line(
            x1: 0,
            y1: 0,
            x2: 100,
            y2: 100,
            stroke: Color.rgb(10, 200, 39),
            strokeWidth: StrokeWidth.width10,
            strokeDasharray: StrokeDasharray.dash1)
      ]);

      await saveSvg(svg, directory + 'lineComplexSvg');
    });
  });
}
