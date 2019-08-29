import 'package:scidart_plot/src/plot/plot.dart';
import 'package:test/test.dart';

void main() {
  const directory = './test_files/';
  group('plot', () {
    test('plot simple', () async {
      var plotExample = plot(10, 10);

      await plotExample.save(directory + 'plotSimple');
    });
  });
}
