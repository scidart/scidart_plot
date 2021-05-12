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

double scaleConversion(double ay, double xStart, double xEnd, double yStart,
    double yEnd, double yMin, double yMax) {
  // http://www.pstcc.edu/nbs/WebPhysics/Chapter12.htm
  // (- yEnd + yPoint) / (yEnd - yStart) = (yMin - ay[i]) / (yMax - yMin)
  // (- yEnd + yPoint) = (yEnd - yStart) * (yMin - ay[i]) / (yMax - yMin)
  //  yPoint = yEnd + ((yEnd - yStart) * (yMin - ay[i]) / (yMax - yMin))

  return yEnd + ((yEnd - yStart) * (yMin - ay) / (yMax - yMin));
}
