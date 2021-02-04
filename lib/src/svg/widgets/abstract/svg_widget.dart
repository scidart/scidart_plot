import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/enums/stroke_width.dart';
import 'package:scidart_plot/src/svg/enums/unit.dart';
import 'package:scidart_plot/src/svg/enums/visibility.dart';

// References
// https://www.w3schools.com/graphics/svg_intro.asp
// https://stackoverflow.com/questions/45439133/what-is-the-default-svg-unit-in-css
// https://stackoverflow.com/questions/11293026/default-background-color-of-svg-root-element
// https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
// https://pub.dev/packages/color#-readme-tab-
// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/visibility

/// Root class that have all the basic SVG attributes
abstract class SvgWidget {
  // properties
  String id;
  Color fill;
  Color stroke;
  StrokeWidth strokeWidth;
  StrokeDasharray strokeDasharray;
  String style;
  String transform;
  Visibility visibility;
  Unit unit;

  // methods
  /// Convert the Svg structure to XML string
  String toXML();

  /// To string converter
  @override
  String toString();
}
