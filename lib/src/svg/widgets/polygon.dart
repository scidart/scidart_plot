import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/primitives/point_pair.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

/// Generate a Polygon
class Polygon implements SvgWidget {
  List<PointPair> points;

  // override
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;
  String unit;

  /// Polygon constructor
  /// [points] A list of points that will be drawn a polygon in the SVG
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  Polygon(
      {@required this.points,
        this.id,
      this.fill,
      this.stroke,
      this.strokeWidth,
        this.strokeDasharray,
        this.style,
        this.transform,
        this.unit = 'px'});

  @override
  String toXML() {
    String pointsXML = '';
    points.forEach((p) => pointsXML += p.toXML() + ' ');

    var xml = '<polygon points="${pointsXML}" '
        'id="${id ?? "none"}" '
        'fill="${fill?.toHexColor()?.toCssString() ?? "none"}" '
        'stroke="${stroke?.toHexColor()?.toCssString() ?? "none"}" '
        'stroke-width="${strokeWidth ?? "none"}" '
        'stroke-dasharray="${strokeDasharray ?? "none"}" '
        'style="${style ?? "none"}" />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
