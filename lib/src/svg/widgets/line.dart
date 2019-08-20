import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

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

  // not used
  Color fill;

  Line({@required this.x1,
    @required this.y1,
    @required this.x2,
    @required this.y2,
    this.id,
    this.stroke,
    this.strokeWidth,
    this.strokeDasharray,
    this.style,
    this.transform});

  @override
  String toXML() {
    var xml = '<line x1="${x1}" y1="${y1}" x2="${x2}" y2="${y2}" '
        'id="${id}" '
        'stroke="${stroke.toHexColor().toCssString()}" '
        'stroke-width="${strokeWidth}" '
        'stroke-dasharray=${strokeDasharray} '
        'style="${style}" />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
