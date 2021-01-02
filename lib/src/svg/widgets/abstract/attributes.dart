import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/enums/visibility.dart';
import 'unit_converter.dart';

String attributes(
    String id,
    Color fill,
    Color stroke,
    double strokeWidth,
    StrokeDasharray strokeDasharray,
    String style,
    String transform,
    String unit,
    Visibility visibility) {
  return 'id="${id ?? "none"}" '
      'fill="${Color.toXml(fill)}" '
      'stroke="${Color.toXml(stroke)}" '
      'stroke-width="${strokeWidth ?? "none"}${unitConv(unit)}" '
      'stroke-dasharray="${StrokeDasharray.toXml(strokeDasharray)}" '
      'style="${style ?? "none"}" '
      'visibility="${visibility.xmlValue ?? Visibility.inherit.xmlValue}"';
}
