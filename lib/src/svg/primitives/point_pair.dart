import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/unit_converter.dart';

/// Primitive type for SVG tags that use point as coordinates: Polygon, Polyline, etc
class PointPair {
  double x;
  double y;

  PointPair({@required this.x, @required this.y});

  String toXML() {
    return '${roundPixelsOnly(x)},${roundPixelsOnly(y)}';
  }

  @override
  String toString() {
    return toXML();
  }
}
