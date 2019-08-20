import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/primitives/point_pair.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

class Polygon implements SvgWidget {
  List<PointPair> points;

  // override
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;

  Polygon(
      {@required this.points,
        this.id,
      this.fill,
      this.stroke,
      this.strokeWidth,
        this.strokeDasharray,
        this.style,
        this.transform});

  @override
  String toXML() {
    String pointsXML = '';
    points.forEach((p) => pointsXML += p.toXML() + ' ');

    var xml = '<polygon points="${pointsXML}" '
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
