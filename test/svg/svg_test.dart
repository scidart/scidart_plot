import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

void main() {
  group('svg', () {
    test('Create a simple svg', () {
      var svg = Svg(
          height: 100, width: 100, children: [Circle(cx: 10, cy: 10, r: 10)]);

      print(svg.toXML());
    });
  });
}
