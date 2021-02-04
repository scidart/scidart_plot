import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/svg/enums/unit.dart';

String roundPixels(double val, Unit unit) {
  return '${truncate(val, 1)}${unit.xmlValue}';
}

String roundPixelsOnly(double val) {
  return '${truncate(val, 1)}';
}

double calcXPoint(double xStart, int i, double distDeltaX) {
  return xStart + (i * distDeltaX);
}

double calcYPoint(double yEnd, int i, double distDeltaY) {
  return yEnd - (i * distDeltaY);
}
