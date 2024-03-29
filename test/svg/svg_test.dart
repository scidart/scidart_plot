import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

import '../helpers.dart';

void main() {
  const directory = './test_files/';
  group('svg', () {
    test('Create a simple svg', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Circle(cx: 10, cy: 10, r: 5, stroke: Color.chocolate),
        Text(x: 5, y: 30, text: 'some text to test', fill: Color.blueviolet),
        Polyline(points: [
          PointPair(x: 0, y: 0),
          PointPair(x: 100, y: 0),
          PointPair(x: 100, y: 100),
          PointPair(x: 0, y: 100),
          PointPair(x: 0, y: 0),
        ], stroke: Color.indigo, strokeWidth: StrokeWidth.width2)
      ]);

      await saveSvg(svg, directory + 'simpleSvg');
    });

    test('Create a svg with background color', () async {
      var svg = SvgCanvas(height: 100, width: 100, fill: Color.gray, children: [
        Circle(cx: 10, cy: 10, r: 5, stroke: Color.chocolate),
        Text(x: 5, y: 30, text: 'some text to test', fill: Color.blueviolet),
        Polyline(points: [
          PointPair(x: 0, y: 0),
          PointPair(x: 100, y: 0),
          PointPair(x: 100, y: 100),
          PointPair(x: 0, y: 100),
          PointPair(x: 0, y: 0),
        ], stroke: Color.indigo, strokeWidth: StrokeWidth.width2)
      ]);

      await saveSvg(svg, directory + 'colorSvg');
    });
  });
}
