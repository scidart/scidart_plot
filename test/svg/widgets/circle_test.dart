import 'package:scidart_plot/scidart_plot.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a circle', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Circle(cx: 10, cy: 10, r: 10, stroke: Color.hex('000000'))
      ]);

      await saveSvg(svg, directory + 'circleSvg');
    });

    test('Create a circle complex', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Circle(
            cx: 10,
            cy: 10,
            r: 10,
            fill: Color.rgb(14, 200, 34),
            stroke: Color.hex('000000'),
            strokeWidth: StrokeWidth.width1,
            strokeDasharray: StrokeDasharray.dash1)
      ]);

      await saveSvg(svg, directory + 'circleComplexSvg');
    });

    test('Create a invisible circle complex', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Circle(
            cx: 10,
            cy: 10,
            r: 10,
            fill: Color.rgb(14, 200, 34),
            stroke: Color.hex('000000'),
            strokeWidth: StrokeWidth.width1,
            strokeDasharray: StrokeDasharray.custom('1% 1%'),
            visibility: Visibility.hidden)
      ]);

      await saveSvg(svg, directory + 'circleComplexInvisibleSvg');
    });
  });
}
