import 'package:meta/meta.dart';
import 'package:scidart/src/numdart/arrays_base/array.dart';
import 'package:scidart_plot/src/plot/line/plot_line.dart';
import 'package:scidart_plot/src/svg/canvas/svg_canvas.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import '../../../scidart_plot.dart';
import 'grid.dart';

SvgCanvas canvasLine({@required Array ax,
            @required List<PlotLine> lines,
            double width = 404.0,
            double height = 278.0,
            bool showGrid = true}) {
  var frameMarginLeft = 50.0;
  var frameMarginTop = 10.0;
  var frameMarginRight = 10.0;
  var frameMarginButton = 20.0;

  // calculate the margin limits
  final xStart = frameMarginLeft;
  final xEnd = width - frameMarginRight;
  final yStart = frameMarginTop;
  final yEnd = height - frameMarginButton;

  // calculate X axis distribution
  final lengthX = xEnd - xStart;
  final distDeltaX = lengthX / ax.length;

  // detect the Y with bigger range as reference to generate Y axis scale
  var yMin = double.infinity;
  var yMax = double.negativeInfinity;
  for (var l in lines) {
    yMin = min(arrayMin(l.ay), yMin);
    yMax = max(arrayMax(l.ay), yMax);
  }

  // generate Y axis array
  var ay = linspace(yMin, yMax, num: ax.length);

  // calculate Y axis distribution
  final lengthY = yEnd - yStart;
  final distDeltaY = lengthY / ay.length;

  var plotGrid = grid(ax: ax,
      ay: ay,
      xStart: xStart,
      xEnd: xEnd,
      yStart: yStart,
      yEnd: yEnd,
      distDeltaX: distDeltaX,
      distDeltaY: distDeltaY,
      frameGridStrokeColor: Color.hex('5F6367'),
      frameGridDasharray: StrokeDasharray.dash5,
      frameAxisStrokeColor: Color.black,
      grid: showGrid,
  );

  var linesSvg = <SvgWidget>[];
  for (var l in lines) {
    linesSvg.add(l.generateLine(ax, xStart, xEnd, yStart, yEnd, distDeltaX, yMin, yMax));
  }
  var linesGroup = Group(children: linesSvg, id: 'lines');

  var plot = SvgCanvas(
      width: width, height: height,
      children: [
        plotGrid,
        linesGroup
      ]);

  return plot;
}
