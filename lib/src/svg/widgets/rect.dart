import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

/// Generate a rectangle
class Rect implements SvgWidget {
  double x;
  double y;
  double width;
  double height;

  // override
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;
  String unit;

  /// Rect constructor
  /// [x] left top x coordinate of the rectangle
  /// [y] left top y coordinate of the rectangle
  /// [width] width of rectangle
  /// [height] height of rectangle
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  Rect({@required this.x,
    @required this.y,
    @required this.width,
    @required this.height,
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
    var xml = '<rect x="${x}" y="${y}" width="${width}" height="${height}" '
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
