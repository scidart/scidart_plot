import 'package:meta/meta.dart';
import 'package:scidart/src/numdart/arrays_base/array.dart';
import 'package:scidart_plot/src/svg/canvas/svg_canvas.dart';
import 'package:scidart/numdart.dart';

import '../../scidart_plot.dart';
import 'grid.dart';

SvgCanvas plot({@required Array ax,
            @required Array ay,
            double plotWidth = 404.0,
            double plotHeight = 278.0,
            bool showGrid = true}) {
  var frameMarginLeft = 50.0;
  var frameMarginTop = 10.0;
  var frameMarginRight = 10.0;
  var frameMarginButton = 20.0;
  
  //var frameWidth = plotWidth - frameMarginRight - frameMarginLeft;
  //var frameHeight = plotHeight - frameMarginButton - frameMarginTop;
  //var frameCenterHeight = frameHeight / 2 + frameMarginTop;

  var plotGrid = grid(width: plotWidth,
      height: plotHeight,
      ax: ax,
      ay: ay,
      frameMarginLeft: frameMarginLeft,
      frameMarginTop: frameMarginTop,
      frameMarginRight: frameMarginRight,
      frameMarginButton: frameMarginButton,
      frameGridStrokeColor: Color.hex('5F6367'),
      frameGridDasharray: '5,5',
      frameAxisStrokeColor: Color.hex('000000'),
      grid: showGrid,
  );

  var plot = SvgCanvas(
      width: plotWidth, height: plotHeight,
      children: [
        plotGrid
      ]);

  return plot;
}
