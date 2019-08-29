import 'package:scidart_plot/src/svg/canvas/svg_canvas.dart';

import 'grid.dart';

SvgCanvas plot(x, y) {
  var plotWidth = 404.0;
  var plotHeight = 278.0;

  var plotGrid = grid(mainWidth: plotWidth,
      mainHeight: plotHeight,
      minX: 0,
      maxX: 10,
      minY: 0,
      maxY: 10);
  var plot = SvgCanvas(
      width: plotWidth, height: plotHeight,
      children: [
        plotGrid
      ]);
  return plot;
}
