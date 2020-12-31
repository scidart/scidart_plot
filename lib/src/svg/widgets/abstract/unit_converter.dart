import 'package:scidart/numdart.dart';

String unitConv(String unit) {
  return '${unit ?? 'px'}';
}

String roundPixels(double val, String unit) {
  return '${truncate(val, 1)}${unitConv(unit)}';
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