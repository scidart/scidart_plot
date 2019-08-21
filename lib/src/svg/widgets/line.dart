import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

/// Generate a line
class Line implements SvgWidget {
  double x1;
  double y1;
  double x2;
  double y2;

  // override
  String id;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;
  String unit;

  // not used
  Color fill;

  /// Line constructor
  /// [x1] start x coordinate point
  /// [y1] start y coordinate point
  /// [x2] end x coordinate point
  /// [y2] end y coordinate point
  /// [id] widget id to made some reference in the SVG file
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  Line({@required this.x1,
    @required this.y1,
    @required this.x2,
    @required this.y2,
    this.id,
    this.stroke,
    this.strokeWidth,
    this.strokeDasharray,
    this.style,
    this.transform,
    this.unit = 'px'});

  @override
  String toXML() {
    var xml = '<line x1="${x1}" y1="${y1}" x2="${x2}" y2="${y2}" '
        'id="${id ?? "none"}" '
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
