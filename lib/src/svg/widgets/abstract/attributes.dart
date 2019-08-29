import 'package:color/color.dart';
import 'package:scidart_plot/src/svg/primitives/constants.dart';
import 'package:scidart_plot/src/svg/primitives/visibility.dart';

import 'unit_converter.dart';

String attributes(
    String id,
    Color fill,
    Color stroke,
    double strokeWidth,
    String strokeDasharray,
    String style,
    String transform,
    String unit,
    Visibility visibility) {
  return 'id="${id ?? "none"}" '
      'fill="${fill?.toHexColor()?.toCssString() ?? "none"}" '
      'stroke="${stroke?.toHexColor()?.toCssString() ?? "none"}" '
      'stroke-width="${strokeWidth ?? "none"}${unitConv(unit)}" '
      'stroke-dasharray="${strokeDasharray ?? "none"}" '
      'style="${style ?? "none"}" '
      'visibility="${visibilityName[visibility] ?? Visibility.inherit}"';
}
