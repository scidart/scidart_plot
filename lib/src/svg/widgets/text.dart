import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

/// Generate a text element
class Text implements SvgWidget {
  double x;
  double y;
  String text;
  double rotate;
  String unit;

  //override
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;

  /// Text constructor
  /// [x] left top x coordinate of the text
  /// [y] left top y coordinate of the text
  /// [text] text that will be displayed
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  Text(
      {@required this.x,
      @required this.y,
      @required this.text,
      this.rotate,
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
    var xml = '<text x="${x}" y="${y}" '
        'id="${id ?? "none"}" '
        'fill="${fill?.toHexColor()?.toCssString() ?? "none"}" '
        'stroke="${stroke?.toHexColor()?.toCssString() ?? "none"}" '
        'stroke-width="${strokeWidth ?? "none"}" '
        'style="${style ?? "none"}" '
        'stroke-dasharray="${strokeDasharray ?? "none"}" '
        'transform="${transform == null ? '' : transform +
        ';'} rotate(${rotate ?? "0"} ${x},${y})">${text}</text>';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
