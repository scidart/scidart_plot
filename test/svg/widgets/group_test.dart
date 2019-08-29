import 'package:scidart_plot/scidart_plot.dart';
import 'package:scidart_plot/src/svg/widgets/group.dart';
import 'package:test/test.dart';

void main() {
  const directory = './test_files/';

  group('svg', () {
    test('Create a group', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Group(children: [
          Circle(cx: 10, cy: 10, r: 10, stroke: Color.hex('000000')),
          Circle(cx: 10, cy: 10, r: 5, stroke: Color.hex('f8f8f8'))
        ], stroke: Color.hex('FFFFF'))
      ]);

      await svg.save(directory + 'groupSvg');
    });

    test('Create a invisible group', () async {
      var svg = SvgCanvas(height: 100, width: 100, children: [
        Group(children: [
          Circle(cx: 10, cy: 10, r: 10, stroke: Color.hex('000000')),
          Circle(cx: 10, cy: 10, r: 5, stroke: Color.hex('f8f8f8'))
        ], stroke: Color.hex('000000'), visibility: Visibility.hidden)
      ]);

      await svg.save(directory + 'groupInvisibleSvg');
    });
  });
}
