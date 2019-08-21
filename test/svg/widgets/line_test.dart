import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a Line', () async {
      var svg = Svg(height: 100, width: 100, children: [
        Line(
          x1: 0,
          y1: 0,
          x2: 100,
          y2: 100,
          stroke: Color.rgb(10, 200, 39),
        )
      ]);

      await svg.save(directory + 'lineSvg');
    });

    test('Create a Line', () async {
      var svg = Svg(height: 100, width: 100, children: [
        Line(
            x1: 0,
            y1: 0,
            x2: 100,
            y2: 100,
            stroke: Color.rgb(10, 200, 39),
            strokeWidth: 10,
            strokeDasharray: '1% 1%')
      ]);

      await svg.save(directory + 'lineComplexSvg');
    });
  });
}
