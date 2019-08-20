import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/abstract/svg_widget.dart';

class Line implements SvgWidget {
  double x1;
  double y1;
  double x2;
  double y2;

  // override
  Color stroke;
  double strokeWidth;
  String style;

  // not used
  Color fill;

  Line({@required this.x1,
    @required this.y1,
    @required this.x2,
    @required this.y2,
    this.stroke,
    this.strokeWidth,
    this.style});

  @override
  String toXML() {
    var xml =
        '<line x1="${x1}" y1="${y1}" x2="${x2}" y2="${y2}" '
        'stroke="${stroke.toHexColor().toCssString()}" '
        'stroke-width="${strokeWidth}" '
        'style="${style}" />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
