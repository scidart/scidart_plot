import 'package:meta/meta.dart';
import 'package:scidart/src/numdart/arrays_base/array.dart';
import 'package:scidart_plot/src/plot/line/plot_line.dart';
import 'package:scidart_plot/src/svg/canvas/svg_canvas.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/font_size.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import '../../../scidart_plot.dart';
import 'grid.dart';

SvgCanvas canvasLine({@required final Array ax,
            @required final List<PlotLine> lines,
            final double width = 414.0,
            double height = 288.0,
            final bool showGrid = true,
            final Color backgroundColor,
            final String title}) {
  // default margins
  final frameMarginLeft = 60.0;
  var frameMarginTop = 10.0;
  final frameMarginRight = 10.0;
  final frameMarginButton = 30.0;

  // adjustment to create plot title
  var titleWidget;
  if (title != null) {
    final titleMargin = 30.0;
    frameMarginTop += titleMargin;
    height += titleMargin;
    titleWidget = Text(x: width/2, y: titleMargin/2, text: title, fill: Color.black,
        textAnchor: TextAnchor.middle, alignmentY: AlignmentY.central,
        fontSize: FontSize.custom(25, Unit.px));
  }

  // create main canvas
  var plot = SvgCanvas(
      fill: backgroundColor,
      width: width, height: height,
      children: []);

  // title creation, if exist
  if (titleWidget != null) {
    plot.children.add(titleWidget);
  }

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
      frameGridStrokeColor: Color.gray,
      frameGridDasharray: StrokeDasharray.dash5,
      frameAxisStrokeColor: Color.black,
      grid: showGrid,
  );

  var linesSvg = <SvgWidget>[];
  for (var l in lines) {
    linesSvg.add(l.generateLine(ax, xStart, xEnd, yStart, yEnd, distDeltaX, yMin, yMax));
  }
  var linesGroup = Group(children: linesSvg, id: 'lines');

  plot.children.add(plotGrid);
  plot.children.add(linesGroup);

  return plot;
}
