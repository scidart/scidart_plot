import 'package:color/color.dart';
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
      'fill="${fill?.toHexColor()?.toCssString() ?? "none"}" '
      'stroke="${stroke?.toHexColor()?.toCssString() ?? "none"}" '
      'stroke-width="${strokeWidth ?? "none"}${unitConv(unit)}" '
      'stroke-dasharray="${StrokeDasharray.toXml(strokeDasharray)}" '
      'style="${style ?? "none"}" '
      'visibility="${visibility.xmlValue ?? Visibility.inherit.xmlValue}"';
}
