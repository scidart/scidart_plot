import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/enums/stroke_width.dart';
import 'package:scidart_plot/src/svg/enums/unit.dart';
import 'package:scidart_plot/src/svg/enums/visibility.dart';

/// Root class that have all the basic SVG attributes
///
/// # References
/// 1. "SVG intro". https://www.w3schools.com/graphics/svg_intro.asp. Retrieved 2021-03-01.
/// 2. "SVG default unit class". https://stackoverflow.com/questions/45439133/what-is-the-default-svg-unit-in-css. Retrieved 2021-03-01.
/// 3. "Default background color for svg root element". https://stackoverflow.com/questions/11293026/default-background-color-of-svg-root-element. Retrieved 2021-03-01.
/// 4. "Scalable Vector Graphics". https://en.wikipedia.org/wiki/Scalable_Vector_Graphics. Retrieved 2021-03-01.
/// 5. "Dart colors". https://pub.dev/packages/color#-readme-tab-. Retrieved 2021-03-01.
/// 6. "SVG visibility". https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/visibility. Retrieved 2021-03-01.
abstract class SvgWidget {
  // properties
  String? id;
  Color? fill;
  Color? stroke;
  StrokeWidth? strokeWidth;
  StrokeDasharray? strokeDasharray;
  String? style;
  String? transform;
  Visibility? visibility;
  Unit? unit;

  // methods
  /// Convert the Svg structure to XML string
  String toXML();

  /// To string converter
  @override
  String toString();
}
