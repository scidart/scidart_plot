import 'package:scidart_plot/scidart_plot.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a Text', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Text(x: 10, y: 10, text: 'lorem ipsum', stroke: Color.hex('000000'))
      ]);

      await saveSvg(svg, directory + 'textSvg');
    });

    test('Create a Text complex', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Text(
            x: 10,
            y: 10,
            text: 'lorem ipsum',
            rotate: 45,
            fill: Color.rgb(14, 200, 34),
            stroke: Color.hex('000000'),
            strokeWidth: StrokeWidth.width1,
            strokeDasharray: StrokeDasharray.dash1)
      ]);

      await saveSvg(svg, directory + 'textComplexSvg');
    });
  });
}
