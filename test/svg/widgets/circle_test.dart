import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a circle', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Circle(cx: 10, cy: 10, r: 10, stroke: Color.hex('000000'))
      ]);

      await svg.save(directory + 'circleSvg');
    });

    test('Create a circle complex', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Circle(
            cx: 10,
            cy: 10,
            r: 10,
            fill: RgbColor(14, 200, 34),
            stroke: Color.hex('000000'),
            strokeWidth: 1,
            strokeDasharray: '1% 1%')
      ]);

      await svg.save(directory + 'circleComplexSvg');
    });

    test('Create a invisible circle complex', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Circle(
            cx: 10,
            cy: 10,
            r: 10,
            fill: RgbColor(14, 200, 34),
            stroke: Color.hex('000000'),
            strokeWidth: 1,
            strokeDasharray: '1% 1%',
            visibility: Visibility.hidden)
      ]);

      await svg.save(directory + 'circleComplexInvisibleSvg');
    });
  });
}
