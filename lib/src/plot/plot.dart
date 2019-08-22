import 'package:scidart_plot/src/svg/svg.dart';

import 'grid.dart';

Svg plot(x, y) {
  var plotWidth = 404.0;
  var plotHeight = 278.0;

  var plotGrid = grid(plotWidth, plotHeight, 0, 0, 0, 0);
  var plot = Svg(width: plotWidth, height: plotHeight, children: plotGrid);
  return plot;
}
