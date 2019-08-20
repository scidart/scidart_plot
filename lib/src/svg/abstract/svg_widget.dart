import 'package:color/color.dart';

abstract class SvgWidget {
  // properties
  Color fill;
  Color stroke;
  double strokeWidth;
  String style;

  // methods
  String toXML();

  String toString();
}
