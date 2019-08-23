import 'package:scidart_plot/src/svg/canvas/svg_canvas.dart';

import 'grid.dart';

SvgCanvas plot(x, y) {
  var plotWidth = 404.0;
  var plotHeight = 278.0;

  var plotGrid = grid(plotWidth, plotHeight, 0, 0, 0, 0);
  var plot = SvgCanvas(
      width: plotWidth, height: plotHeight, children: plotGrid);
  return plot;
}
