import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import '../../scidart_plot.dart';

List<SvgWidget> grid(
    double mainWidth, double mainHeight, minX, maxX, minY, maxY) {
  var frameStrokeColor = Color.rgb(10, 10, 10);
  var frameFillColor = Color.rgb(255, 255, 255);
  var frameStrokeWidth = 0.5;
  var frameMarginLeft = 10.0;
  var frameMarginTop = 10.0;
  var frameMarginRight = 10.0;
  var frameMarginButton = 10.0;

  var frameWidth = mainWidth - frameMarginRight - frameMarginLeft;
  var frameHeight = mainHeight - frameMarginButton - frameMarginTop;
  var frameXStart = frameMarginLeft;
  var frameXEnd = frameXStart + frameWidth;
  var frameYStart = frameMarginTop;
  var frameYEnd = frameYStart + frameHeight;

  var gridMarginLeft = 1.0;
  var gridMarginTop = 1.0;
  var gridMarginRight = 1.0;
  var gridMarginButton = 1.0;
  var gridStrokeColor = Color.rgb(191, 191, 191);

  // vertical lines
  var gridVerticalXStart = frameXStart + gridMarginLeft;
  var gridVerticalXEnd = frameXEnd - gridMarginRight;
  var gridVerticalXInterval = 10;
  var gridVerticalYStartConstant = frameYStart;
  var gridVerticalYEndConstant = frameYEnd;

  // generate frame
  List<SvgWidget> widgets = [
    Rect(
        x: frameXStart,
        y: frameYStart,
        width: frameWidth,
        height: frameHeight,
        fill: frameFillColor,
        stroke: frameStrokeColor,
        strokeWidth: frameStrokeWidth)
  ];

  // generate the vertical lines
  for (var i = gridVerticalXStart;
      i < gridVerticalXEnd;
      i += gridVerticalXInterval) {
    widgets.add(Line(
        x1: i,
        y1: gridVerticalYStartConstant,
        x2: i,
        y2: gridVerticalYEndConstant,
        stroke: gridStrokeColor));
  }

  return widgets;
}
