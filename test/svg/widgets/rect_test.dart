import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a Rect', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Rect(x: 10, y: 10, width: 10, height: 10, stroke: Color.hex('000000'))
      ]);

      await saveSvg(svg, directory + 'rectSvg');
    });

    test('Create a Rect complex', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Rect(
            x: 10,
            y: 10,
            width: 10,
            height: 10,
            fill: RgbColor(14, 200, 34),
            stroke: Color.hex('000000'),
            strokeWidth: 1,
            strokeDasharray: '1% 1%')
      ]);

      await saveSvg(svg, directory + 'rectComplexSvg');
    });
  });
}
