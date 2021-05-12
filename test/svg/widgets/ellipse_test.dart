import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a Ellipse', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Ellipse(cx: 10, cy: 10, rx: 10, ry: 5, stroke: Color.hex('000000'))
      ]);

      await saveSvg(svg, directory + 'ellipseSvg');
    });

    test('Create a Ellipse', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Ellipse(
            cx: 10,
            cy: 10,
            rx: 10,
            ry: 5,
            fill: Color.rgb(14, 200, 34),
            stroke: Color.hex('000000'),
            strokeWidth: StrokeWidth.width1,
            strokeDasharray: StrokeDasharray.dash1)
      ]);

      await saveSvg(svg, directory + 'ellipseComplexSvg');
    });
  });
}
