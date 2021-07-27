import 'dart:math';

import 'package:scidart_plot/src/plot/widgets/plot_base.dart';
import 'package:scidart_plot/src/plot/widgets/legend_item.dart';
import 'package:scidart_plot/src/plot/widgets/legend_position.dart';
import 'package:scidart_plot/src/svg/svg.dart';

/// Base class to generate plot legends groups
///
/// # Constructors:
/// ```dart
/// Legend(this.items, this.position, {this.backgroundColor, this.textColor});
/// ```
///
/// # Examples
/// ```dart
/// var series = Array([5, 3, 5]);
/// var line1 = PlotPie(fill: Color.blue);
/// var line2 = PlotPie(fill: Color.red);
/// var line3 = PlotPie(fill: Color.green);
///
/// var legend1 = LegendItem('slice 1');
/// var legend2 = LegendItem('slice 2');
/// var legend3 = LegendItem('slice 3');
///
/// var plotExample = canvasPie(
///   series: series,
///   pies: [line1, line2, line3],
///   legend:
///     Legend([legend1, legend2, legend3], LegendPosition.bottomRight));
///
/// print(plotExample.toXML());
///
/// /* output:
/// <?xml version="1.0" encoding="UTF-8" ?>
/// <svg width="414.0" height="318.0" xmlns="http://www.w3.org/2000/svg">
/// 	<text x="207.0px" y="15.0px" text-anchor="middle" font-size="25.0px" dy=".4em" id="none" fill="black" stroke="none" stroke-width="none" stroke-dasharray="none" style="none" visibility="inherit" >Example plot</text>
/// 	<g id="lines" fill="none" stroke="none" stroke-width="none" stroke-dasharray="none" style="none" visibility="inherit" >	<g id="plot_line" fill="none" stroke="none" stroke-width="none" stroke-dasharray="none" style="none" visibility="inherit" >	<polyline points="60.0,164.0 66.9,78.9 73.8,40.0 80.6,68.3 87.5,148.4 94.4,237.0 101.3,286.0 108.2,268.9 115.0,194.9 121.9,104.1 128.8,45.8 135.7,51.6 142.6,118.3 149.4,209.7 156.3,276.4 163.2,282.2 170.1,223.9 177.0,133.1 183.8,59.1 190.7,42.0 197.6,91.0 204.5,179.6 211.4,259.7 218.2,288.0 225.1,249.1 232.0,164.0 238.9,78.9 245.8,40.0 252.6,68.3 259.5,148.4 266.4,237.0 273.3,286.0 280.2,268.9 287.0,194.9 293.9,104.1 300.8,45.8 307.7,51.6 314.6,118.3 321.4,209.7 328.3,276.4 335.2,282.2 342.1,223.9 349.0,133.1 355.8,59.1 362.7,42.0 369.6,91.0 376.5,179.6 383.4,259.7 390.2,288.0 397.1,249.1 " id="none" fill="none" stroke="#ff0000" stroke-width="none" stroke-dasharray="none" style="none" visibility="inherit" />
/// </g>
/// <!--	the SVG is too long to put here	-->
/// </svg>
/// */
/// ```
class Legend {
  List<LegendItem> items;
  Color? backgroundColor = Color.white;
  Color? textColor;
  LegendPosition position;

  Legend(this.items, this.position, {this.backgroundColor, this.textColor});

  SvgWidget generate(double xStart, double yStart, double xEnd, double yEnd,
      List<PlotBase> lines,
      {bool fillColor = false}) {
    const marginTop = 15.0;
    const marginLeft = 5.0;
    const marginRight = 5.0;
    const lineLength = 10.0;

    // calculate the width based with the maximum string length
    const textLetterLength = 5.6;
    var maxLengthString = 0;
    for (var item in items) {
      maxLengthString = max(maxLengthString, item.name.length);
    }
    final textLength = textLetterLength * maxLengthString;

    const marginLeftText = 5.0;
    final legendWidth =
        marginLeftText + lineLength + marginLeftText + textLength + marginRight;
    final legendHeight = marginTop + marginTop * lines.length;

    // calculate x and y positions
    double x, y;
    switch (position) {
      case LegendPosition.topLeft:
        x = xStart;
        y = yStart;
        break;
      case LegendPosition.topRight:
        x = xEnd - legendWidth;
        y = yStart;
        break;
      case LegendPosition.bottomLeft:
        x = xStart;
        y = yEnd - legendHeight;
        break;
      case LegendPosition.bottomRight:
        x = xEnd - legendWidth;
        y = yEnd - legendHeight;
        break;
      case LegendPosition.center:
        x = xStart + ((xEnd - xStart) / 2) - (legendWidth / 2);
        y = yStart + ((yEnd - yStart) / 2) - (legendHeight / 2);
        break;
    }

    if (lines.length != items.length) {
      throw FormatException(
          'expected legendItems and lines to have the same length');
    }

    var g = Group(id: 'legend', children: []);

    // create legend square
    g.children.add(Rect(
        x: x,
        y: y,
        width: legendWidth,
        height: legendHeight,
        fill: backgroundColor ?? Color.white));

    // create legend items
    for (var i = 0; i < lines.length; i++) {
      var color;
      if (fillColor) {
        color = lines[i].fill;
      } else {
        color = lines[i].stroke ?? lines[i].fill;
      }

      g.children.add(items[i].generate(
          x + marginLeft,
          y + marginTop + (i * marginTop),
          color,
          textColor ?? Color.black,
          lineLength,
          marginLeftText));
    }

    return g;
  }
}
