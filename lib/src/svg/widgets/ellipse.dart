import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

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
        this.transform});

  @override
  String toXML() {
    var xml = '<ellipse cx="${cx}" cy="${cx}" rx="${rx}" ry="${ry}" '
        'id="${id}" '
        'fill="${fill.toHexColor().toCssString()}" '
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
