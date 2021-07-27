import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/svg/enums/unit.dart';

/// Round pixels values to 1 decimal point max.
String roundPixels(double val, Unit? unit) {
  return '${truncate(val, 1)}${unit?.xmlValue ?? Unit.px}';
}

/// Round only pixel number without include the unity.
String roundPixelsOnly(double val) {
  return '${truncate(val, 1)}';
}

/// Calculate some X point in pixel from x start point [xStart], index [i]
/// and delta X distance [distDeltaX]
double calcXPoint(double xStart, int i, double distDeltaX) {
  return xStart + (i * distDeltaX);
}

/// Calculate some Y point in pixel from y end point [yEnd], index [i]
/// and delta Y distance [distDeltaY]
double calcYPoint(double yEnd, int i, double distDeltaY) {
  return yEnd - (i * distDeltaY);
}

/// Scale/Convert Y points from Array values to Pixels values, this is important
/// to plot in the correct position and keep the values set proportions.
///
/// # References
/// 1. "Comparison Between Celsius and Fahrenheit Scales". http://www.pstcc.edu/nbs/WebPhysics/Chapter12.htm. Retrieved 2021-03-01.
double scaleConversion(
    double ay, double yStart, double yEnd, double yMin, double yMax) {
  // http://www.pstcc.edu/nbs/WebPhysics/Chapter12.htm
  // (- yEnd + yPoint) / (yEnd - yStart) = (yMin - ay[i]) / (yMax - yMin)
  // (- yEnd + yPoint) = (yEnd - yStart) * (yMin - ay[i]) / (yMax - yMin)
  //  yPoint = yEnd + ((yEnd - yStart) * (yMin - ay[i]) / (yMax - yMin))

  return yEnd + ((yEnd - yStart) * (yMin - ay) / (yMax - yMin));
}
