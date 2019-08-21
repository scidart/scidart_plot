import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

/// Generate a circle
class Circle implements SvgWidget {
  double cx;
  double cy;
  double r;

  // override
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;
  String unit;

  /// Circle constructor
  /// [cx] center x coordinate of the circle
  /// [cy] center y coordinate of the circle
  /// [r] circle radius
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  Circle({@required this.cx,
    @required this.cy,
    @required this.r,
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
    var xml = '<circle cx="${cx}${unit}" cy="${cy}${unit}" r="${r}${unit}" '
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
