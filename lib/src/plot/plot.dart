import 'package:scidart/src/numdart/arrays_base/array.dart';
import 'package:scidart_plot/src/svg/canvas/svg_canvas.dart';
import 'package:scidart/numdart.dart';

import '../../scidart_plot.dart';
import 'grid.dart';

double convertToPixel(double frameLenght, double arrayDiff, double arrayPoint) {
  return ((arrayPoint * frameLenght) / arrayDiff);
}

SvgCanvas plot(plotWidth, plotHeight, Array ax, Array ay) {
  var frameMarginLeft = 40.0;
  var frameMarginTop = 10.0;
  var frameMarginRight = 10.0;
  var frameMarginButton = 20.0;
  var frameWidth = plotWidth - frameMarginRight - frameMarginLeft;
  var frameHeight = plotHeight - frameMarginButton - frameMarginTop;

  var axMin = arrayMin(ax);
  var axMax = arrayMax(ax);
  var ayMin = arrayMin(ay);
  var ayMax = arrayMax(ay);
  var axArrayDiff = axMax - axMin;
  var ayArrayDiff = ayMax - ayMin;

  var frameCenterHeight = frameHeight / 2 + frameMarginTop;

  var plotGrid = grid(mainWidth: plotWidth,
      mainHeight: plotHeight,
      minX: axMin,
      maxX: axMax,
      minY: ayMin,
      maxY: ayMax,
      frameMarginLeft: frameMarginLeft,
      frameMarginTop: frameMarginTop,
      frameMarginRight: frameMarginRight,
      frameMarginButton: frameMarginButton,
      frameStrokeColor: Color.rgb(10, 10, 10),
      frameFillColor: Color.rgb(255, 255, 255),
  );

  var points = <PointPair>[];
  for (var i = 0; i < ax.length; i++) {
    var x = frameMarginLeft + convertToPixel(frameWidth, axArrayDiff, ax[i]);
    var y = frameCenterHeight - convertToPixel(frameHeight, ayArrayDiff, ay[i]);
    var point = PointPair(x: x, y: y);
    points.add(point);
  }

  var plotLine = Polyline(points: points, stroke: Color.hex('#8ED1EC'));

  var plot = SvgCanvas(
      width: plotWidth, height: plotHeight,
      children: [
        plotGrid,
        plotLine
      ]);

  return plot;
}
