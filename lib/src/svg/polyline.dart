import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/abstract/svg_widget.dart';
import 'package:scidart_plot/src/svg/primitives/point_pair.dart';

class Polyline implements SvgWidget {
  List<PointPair> points;

  // override
  Color fill;
  Color stroke;
  double strokeWidth;
  String style;

  Polyline(
      {@required this.points,
      this.fill,
      this.stroke,
      this.strokeWidth,
      this.style});

  @override
  String toXML() {
    String pointsXML = '';
    points.forEach((p) => pointsXML += p.toXML() + ' ');

    var xml = '<polyline points="${pointsXML}" '
        'fill="${fill.toHexColor().toCssString()}" '
        'stroke="${stroke.toHexColor().toCssString()}" '
        'stroke-width="${strokeWidth}" '
        'style="${style}" />';
    return xml;
  }
}