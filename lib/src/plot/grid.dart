import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import '../../scidart_plot.dart';

SvgWidget grid({@required double mainWidth,
  @required double mainHeight,
  @required double minX,
  @required double maxX,
  @required double minY,
  @required double maxY,
  @required double frameMarginLeft,
  @required double frameMarginTop,
  @required double frameMarginRight,
  @required double frameMarginButton,
  id = 'grid'}) {
  var frameStrokeColor = Color.rgb(10, 10, 10);
  var frameFillColor = Color.rgb(255, 255, 255);
  var frameStrokeWidth = 0.5;

  var gridMarginLeft = 5.0;
  var gridMarginTop = 5.0;
  var gridMarginRight = 5.0;
  var gridMarginButton = 5.0;
  var gridVerticalStrokeColor = Color.rgb(191, 191, 191);
  var gridHorizontalStrokeColor = Color.rgb(191, 191, 191);
  var gridVerticalScaleLineSize = 5;
  var gridHorizontalScaleLineSize = 5;

  // frame parameters
  var frameWidth = mainWidth - frameMarginRight - frameMarginLeft;
  var frameHeight = mainHeight - frameMarginButton - frameMarginTop;
  var frameXStart = frameMarginLeft;
  var frameXEnd = frameXStart + frameWidth;
  var frameYStart = frameMarginTop;
  var frameYEnd = frameYStart + frameHeight;

  // vertical lines
  var gridVerticalXStart = frameXStart + gridMarginLeft;
  var gridVerticalXEnd = frameXEnd - gridMarginRight;
  var gridVerticalYStartConstant = frameYStart;
  var gridVerticalYEndConstant = frameYEnd;

  // horizontal lines
  var gridHorizontalXStartConstant = frameXStart;
  var gridHorizontalXEndConstant = frameXEnd;
  var gridHorizontalYStart = frameYStart + gridMarginTop;
  var gridHorizontalYEnd = frameYEnd - gridMarginButton;

  // x scale (vertical lines)
  var scaleXStart = minX;
  var scaleXTotal = (maxX - minX) / 0.001;

  // y scale (horizontal lines)
  var scaleYEnd = maxY;
  var scaleYTotal = (maxY - minY) / 0.002;

  // lines intervals
  var gridVerticalXInterval = scaleXTotal /
      (gridVerticalXEnd - gridVerticalXStart);
  var gridHorizontalYInterval = scaleYTotal /
      (gridHorizontalYEnd - gridHorizontalYStart);

  // scale intervals
  var scaleXInterval = (maxX - minX) /
      ((gridVerticalXEnd - gridVerticalXStart) / gridVerticalXInterval).floor();
  var scaleYInterval = (maxY - minY) /
      ((gridHorizontalYEnd - gridHorizontalYStart) / gridHorizontalYInterval)
          .floor();

  // generate frame
  var widgets = <SvgWidget>[
    Rect(
        x: frameXStart,
        y: frameYStart,
        width: frameWidth,
        height: frameHeight,
        fill: frameFillColor,
        stroke: frameStrokeColor,
        strokeWidth: frameStrokeWidth)
  ];

  var scaleXText = scaleXStart;
  // generate the vertical lines
  for (var i = gridVerticalXStart;
  i <= gridVerticalXEnd;
  i += gridVerticalXInterval) {
    widgets.add(Line(
        x1: i,
        y1: gridVerticalYStartConstant,
        x2: i,
        y2: gridVerticalYEndConstant,
        stroke: gridVerticalStrokeColor));

    // create small line above vertical lines
    widgets.add(Line(
        x1: i,
        y1: gridVerticalYEndConstant,
        x2: i,
        y2: gridVerticalYEndConstant + gridVerticalScaleLineSize,
        stroke: frameStrokeColor));

    // generate x scale (vertical lines)
    widgets.add(Text(
        x: i - 8,
        y: gridVerticalYEndConstant + 3 * gridVerticalScaleLineSize,
        text: truncate(scaleXText, 1).toString(),
        fill: frameStrokeColor));
    scaleXText += scaleXInterval;
  }

  var scaleYText = scaleYEnd;
  // generate the horizontal lines
  for (var i = gridHorizontalYStart;
  i <= gridHorizontalYEnd;
  i += gridHorizontalYInterval) {
    widgets.add(Line(
        x1: gridHorizontalXStartConstant,
        y1: i,
        x2: gridHorizontalXEndConstant,
        y2: i,
        stroke: gridHorizontalStrokeColor));

    // create small line left of horizontal lines
    widgets.add(Line(
        x1: gridHorizontalXStartConstant - gridHorizontalScaleLineSize,
        y1: i,
        x2: gridHorizontalXStartConstant,
        y2: i,
        stroke: frameStrokeColor));

    // generate y scale (horizontal lines)
    widgets.add(Text(
        x: gridHorizontalXStartConstant - 6 * gridHorizontalScaleLineSize,
        y: i + 4,
        text: truncate(scaleYText, 1).toString(),
        fill: frameStrokeColor));
    scaleYText -= scaleYInterval;
  }

  return Group(id: id, children: widgets);
}
