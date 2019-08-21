import 'package:color/color.dart';

// References
// https://www.w3schools.com/graphics/svg_intro.asp
// https://stackoverflow.com/questions/45439133/what-is-the-default-svg-unit-in-css
// https://stackoverflow.com/questions/11293026/default-background-color-of-svg-root-element
// https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
// https://pub.dev/packages/color#-readme-tab-

/// Root class that have all the basic SVG attributes
abstract class SvgWidget {
  // properties
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;
  String unit;

  // methods
  /// Convert the Svg structure to XML string
  String toXML();

  /// To string converter
  String toString();
}
