import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/enums/unit.dart';
import 'package:scidart_plot/src/svg/primitives/point_pair.dart';
import 'package:scidart_plot/src/svg/enums/visibility.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import 'abstract/attributes.dart';

/// Generate a Polyline
class Polyline implements SvgWidget {
  List<PointPair> points;

  // override
  @override
  String id;
  @override
  Color fill;
  @override
  Color stroke;
  @override
  double strokeWidth;
  @override
  StrokeDasharray strokeDasharray;
  @override
  String style;
  @override
  String transform;
  @override
  Unit unit;
  @override
  Visibility visibility;

  /// Polyline constructor
  /// [points] A list of points that will be drawn a polyline in the SVG
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  /// [visibility] visibility of the element, default is inherit
  Polyline(
      {@required this.points,
        this.id,
      this.fill,
      this.stroke,
      this.strokeWidth,
        this.strokeDasharray,
        this.style,
        this.transform,
        this.unit,
        this.visibility = Visibility.inherit});

  @override
  String toXML() {
    var pointsXML = '';
    points.forEach((p) => pointsXML += p.toXML() + ' ');

    var xml = '<polyline points="${pointsXML}" '
        '${attributes(
        id,
        fill,
        stroke,
        strokeWidth,
        strokeDasharray,
        style,
        transform,
        unit,
        visibility)} />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
