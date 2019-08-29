import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a Ellipse', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Ellipse(cx: 10, cy: 10, rx: 10, ry: 5, stroke: Color.hex('000000'))
      ]);

      await svg.save(directory + 'ellipseSvg');
    });

    test('Create a Ellipse', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Ellipse(
            cx: 10,
            cy: 10,
            rx: 10,
            ry: 5,
            fill: RgbColor(14, 200, 34),
            stroke: Color.hex('000000'),
            strokeWidth: 1,
            strokeDasharray: '1% 1%')
      ]);

      await svg.save(directory + 'ellipseComplexSvg');
    });
  });
}
