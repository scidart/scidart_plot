import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/plot.dart';
import 'package:test/test.dart';

void main() {
  const directory = './test_files/';
  group('plot', () {
    test('plot simple', () async {
      // generate the signals for test
      // 1Hz sine wave with incomplete with result a spectral leakage
      // in the frequency domain
      var N = 20.0;
      var fs = 128.0;
      var n = linspace(0, N, num: (N * fs).toInt(), endpoint: false);
      var f1 = 60.0; // 1Hz
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      print(sg);
      var plotExample = plot(404.0, 278.0, n, sg);

      await plotExample.save(directory + 'plotSimple');
    });
  });
}
