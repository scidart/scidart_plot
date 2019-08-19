import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/abstract/svg_widget.dart';

class Circle implements SvgWidget {
  double cx;
  double cy;
  double r;

  String stroke;
  double strokeWidth;
  String fill;

  @override
  String style;

  Circle(
      {@required this.cx,
      @required this.cy,
      @required this.r,
      this.stroke,
      this.strokeWidth,
      this.fill,
      this.style});

  @override
  String toXML() {
    var xml =
        '<circle cx="${cx}" cy="${cy}" r="${r}" stroke="${stroke}" stroke-width="${strokeWidth}" fill="${fill}" />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
