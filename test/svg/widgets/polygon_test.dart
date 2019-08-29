import 'package:scidart_plot/scidart_plot.dart';
import 'package:scidart_plot/src/svg/primitives/point_pair.dart';
import 'package:test/test.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a Polygon', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Polygon(
          points: [
            PointPair(x: 0, y: 0),
            PointPair(x: 10, y: 5),
            PointPair(x: 100, y: 100),
            PointPair(x: 50, y: 80),
          ],
          stroke: Color.rgb(10, 200, 39),
        )
      ]);

      await svg.save(directory + 'polygonSvg');
    });

    test('Create a Polygon', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Polygon(
            points: [
              PointPair(x: 0, y: 0),
              PointPair(x: 10, y: 5),
              PointPair(x: 100, y: 100),
              PointPair(x: 50, y: 80),
            ],
            fill: Color.rgb(100, 100, 8),
            stroke: Color.rgb(10, 200, 39),
            strokeWidth: 5,
            strokeDasharray: '1% 1%')
      ]);

      await svg.save(directory + 'polygonComplexSvg');
    });
  });
}
