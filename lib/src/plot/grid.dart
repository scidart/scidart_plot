import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/unit_converter.dart';

import '../../scidart_plot.dart';

SvgWidget grid({@required Array ax,
  @required Array ay,
  @required double xStart,
  @required double xEnd,
  @required double yStart,
  @required double yEnd,
  @required double distDeltaX,
  @required double distDeltaY,
  @required frameGridStrokeColor,
  @required frameGridDasharray,
  @required frameAxisStrokeColor,
  @required grid,
  id = 'grid'}) {
  // main widgets list
  var widgets = <SvgWidget>[];

  // draw X axis
  widgets.add(Line(
      x1: xStart,
      y1: yEnd,
      x2: xEnd,
      y2: yEnd,
      stroke: frameAxisStrokeColor));

  // draw Y axis
  widgets.add(Line(
      x1: xStart,
      y1: yStart,
      x2: xStart,
      y2: yEnd,
      stroke: frameAxisStrokeColor));

  // draw X axis mark
  for(var i = 0; i < ax.length; i++) {
    var xPoint = calcXPoint(xStart, i, distDeltaX);
    widgets.add(Line(
        x1:  xPoint,
        y1: yEnd,
        x2: xPoint,
        y2: yEnd + 10,
        stroke: frameAxisStrokeColor
    ));
  }

  // draw Y axis mark
  for(var i = 0; i < ay.length; i++) {
    var yPoint = calcYPoint(yEnd, i, distDeltaY);
    widgets.add(Line(
        x1:  xStart,
        y1: yPoint,
        x2: xStart - 10,
        y2: yPoint,
        stroke: frameAxisStrokeColor
    ));
  }

  // draw X axis numbers
  if(distDeltaX < 10.0) {
    // if delta is too small, only draw the texts in even position to optimize the space
    for(var i = 0; i < ax.length; i++) {
      if (i.isEven) {
        var xPoint = calcXPoint(xStart, i, distDeltaX);
        widgets.add(Text(x: xPoint,
            y: yEnd + 10,
            text: truncate(ax[i], 4).toString().toString(),
            fill: frameAxisStrokeColor));
      }
    }
  } else {
    for(var i = 0; i < ax.length; i++) {
      var xPoint = calcXPoint(xStart, i, distDeltaX);
      widgets.add(Text(x: xPoint,
          y: yEnd + 10,
          text: truncate(ax[i], 4).toString().toString(),
          fill: frameAxisStrokeColor));
    }
  }
    
  // draw Y axis numbers
  if(distDeltaY < 10.0) {
    // if delta is too small, only draw the texts in even position to optimize the space
    for(var i = 0; i < ay.length; i++) {
      if (i.isEven) {
        var yPoint = calcYPoint(yEnd, i, distDeltaY);
        widgets.add(Text(x: xStart,
            y: yPoint,
            text: truncate(ay[i], 4).toString().toString(),
            fill: frameAxisStrokeColor));
      }
    }
  } else {
    for(var i = 0; i < ay.length; i++) {
      var yPoint = calcYPoint(yEnd, i, distDeltaY);
      widgets.add(Text(x: 0,
          y: yPoint,
          text: truncate(ay[i], 4).toString().toString(),
          fill: frameAxisStrokeColor));
    }
  }

  if (grid) {
    // the insertion always start with 1 to don't overlap the axis
    // draw X grid lines
    if(distDeltaX < 10.0) {
      // if delta is too small, only draw the texts in even position to optimize the space
      for (var i = 1; i < ax.length; i++) {
        if (i.isEven) {
          var xPoint = calcXPoint(xStart, i, distDeltaX);
          widgets.add(Line(
              x1: xPoint,
              y1: yStart,
              x2: xPoint,
              y2: yEnd,
              stroke: frameGridStrokeColor,
              strokeDasharray: frameGridDasharray
          ));
        }
      }
    } else {
      for (var i = 1; i < ax.length; i++) {
        var xPoint = calcXPoint(xStart, i, distDeltaX);
        widgets.add(Line(
            x1: xPoint,
            y1: yStart,
            x2: xPoint,
            y2: yEnd,
            stroke: frameGridStrokeColor,
            strokeDasharray: frameGridDasharray
        ));
      }
    }

    // draw Y grid lines
    if(distDeltaY < 10.0) {
      // if delta is too small, only draw the texts in even position to optimize the space
      for (var i = 1; i < ay.length; i++) {
        if (i.isEven) {
          var yPoint = calcYPoint(yEnd, i, distDeltaY);
          widgets.add(Line(
              x1: xStart,
              y1: yPoint,
              x2: xEnd,
              y2: yPoint,
              stroke: frameGridStrokeColor,
              strokeDasharray: frameGridDasharray
          ));
        }
      }
    } else {
      for (var i = 1; i < ay.length; i++) {
        var yPoint = calcYPoint(yEnd, i, distDeltaY);
        widgets.add(Line(
            x1: xStart,
            y1: yPoint,
            x2: xEnd,
            y2: yPoint,
            stroke: frameGridStrokeColor,
            strokeDasharray: frameGridDasharray
        ));
      }
    }
  }

  return Group(id: id, children: widgets);
}