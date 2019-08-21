import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

/// Generate a Ellipse
class Ellipse implements SvgWidget {
  double cx;
  double cy;
  double rx;
  double ry;

  // override
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;
  String unit;

  /// Ellipse constructor
  /// [cx] center x coordinate of the ellipse
  /// [cy] center y coordinate of the ellipse
  /// [rx] ellipse radius in x
  /// [ry] ellipse radius in y
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  Ellipse(
      {@required this.cx,
      @required this.cy,
      @required this.rx,
      @required this.ry,
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
    var xml = '<ellipse cx="${cx}" cy="${cx}" rx="${rx}" ry="${ry}" '
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
