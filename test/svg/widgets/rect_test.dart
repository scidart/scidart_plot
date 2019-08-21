import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a Rect', () async {
      var svg = Svg(height: 100, width: 100, children: [
        Rect(x: 10, y: 10, width: 10, height: 10, stroke: Color.hex('000000'))
      ]);

      await svg.save(directory + 'rectSvg');
    });

    test('Create a Rect complex', () async {
      var svg = Svg(height: 100, width: 100, children: [
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

      await svg.save(directory + 'rectComplexSvg');
    });
  });
}
