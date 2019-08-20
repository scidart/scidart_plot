import 'package:color/color.dart';

abstract class SvgWidget {
  // properties
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;

  // methods
  String toXML();

  String toString();
}
