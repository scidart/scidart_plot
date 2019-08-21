import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a Text', () async {
      var svg = Svg(height: 100, width: 100, children: [
        Text(x: 10, y: 10, text: 'lorem ipsum', stroke: Color.hex('000000'))
      ]);

      await svg.save(directory + 'textSvg');
    });

    test('Create a Text complex', () async {
      var svg = Svg(height: 100, width: 100, children: [
        Text(
            x: 10,
            y: 10,
            text: 'lorem ipsum',
            rotate: 45,
            fill: RgbColor(14, 200, 34),
            stroke: Color.hex('000000'),
            strokeWidth: 1,
            strokeDasharray: '1% 1%')
      ]);

      await svg.save(directory + 'textComplexSvg');
    });
  });
}
