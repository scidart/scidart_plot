import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/pie/plot_pie.dart';
import 'package:scidart_plot/src/plot/widgets/legend.dart';
import 'package:scidart_plot/src/svg/svg.dart';

SvgCanvas canvasPie({
  @required final Array series,
  @required final List<PlotPie> pies,
  final double width = 414.0,
  double height = 288.0,
  final Color backgroundColor,
  final String title,
  final Legend legend,
  final Color axisTextColor,
}) {
  if (series.length != pies.length) {
    throw FormatException('series and pies must have same length');
  }

  // margins
  var frameMarginTop = 0.0;

  // adjustment to create plot title
  var titleWidget;
  if (title != null) {
    final titleMargin = 30.0;
    frameMarginTop += titleMargin;
    height += titleMargin;
    titleWidget = Text(
        x: width / 2,
        y: titleMargin / 2,
        text: title,
        fill: Color.black,
        textAnchor: TextAnchor.middle,
        alignmentY: AlignmentY.central,
        fontSize: FontSize.custom(25, Unit.px));
  }

  // calculate the margin limits
  final xStart = 0.0;
  final xEnd = width;
  final yStart = 0.0;
  final yEnd = height;

  // create main canvas
  var plot = SvgCanvas(
      fill: backgroundColor, width: width, height: height, children: []);

  // add title if necessary
  if (titleWidget != null) {
    plot.children.add(titleWidget);
  }

  // calculate the center
  final xCenter = width / 2;
  final yCenter = frameMarginTop + ((height - frameMarginTop) / 2);
  final radius = min(width, height) / 3;

  // total
  final total = arraySum(series);

  // draw the pies
  var previousEndAngle = 0.0;
  for (var i = 0; i < series.length; i++) {
    var percent = series[i] / total;
    var percentAngle = percent * 360;

    var startAngle = previousEndAngle;
    var endAngle = previousEndAngle + percentAngle;
    previousEndAngle = endAngle;

    plot.children
        .add(pies[i].generate(xCenter, yCenter, radius, startAngle, endAngle));
  }

  // add legend to the plot
  if (legend != null) {
    plot.children.add(
        legend.generate(xStart, yStart, xEnd, yEnd, pies, fillColor: true));
  }

  return plot;
}
