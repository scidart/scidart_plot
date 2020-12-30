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
      var N = 0.1;
      //var n = linspace(0, N, num: 10, endpoint: false); // fix infinit loop problem
      var n = linspace(0, N, num: 10, endpoint: false);
      var f1 = 60.0; // 1Hz
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      print(sg);

      //https://css-tricks.com/how-to-make-charts-with-svg/
      //https://google.github.io/charts/flutter/example/line_charts/simple

      var plotExample = plot(ax: n, ay: sg);

      await plotExample.save(directory + 'plotSimple');
    });
  });
}
