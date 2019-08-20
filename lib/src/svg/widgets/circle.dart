import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

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

  Circle({@required this.cx,
    @required this.cy,
    @required this.r,
    this.id,
    this.fill,
    this.stroke,
    this.strokeWidth,
    this.strokeDasharray,
    this.style,
    this.transform});

  @override
  String toXML() {
    var xml = '<circle cx="${cx}" cy="${cy}" r="${r}" '
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
