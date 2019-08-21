import 'package:meta/meta.dart';

/// Primitive type for SVG tags that use point as coordinates: Polygon, Polyline, etc
class PointPair {
  double x;
  double y;

  PointPair({@required this.x, @required this.y});

  String toXML() {
    return '${x},${y}';
  }

  @override
  String toString() {
    return toXML();
  }
}
