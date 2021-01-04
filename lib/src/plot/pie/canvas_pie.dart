import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/pie/plot_pie.dart';
import 'package:scidart_plot/src/plot/widgets/legend.dart';
import 'package:scidart_plot/src/svg/svg.dart';

SvgCanvas canvasPie({@required final Array series,
  @required final List<PlotPie> pies,
  final double width = 414.0,
  double height = 288.0,
  final Color backgroundColor,
  final String title,
  final Legend legend,
  final Color axisTextColor,
}) {
  var frameMarginTop = 0.0;

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

  // calculate the center
  final xCenter = width/2;
  final yCenter = frameMarginTop + ((height - frameMarginTop)/2);

  // create main canvas
  var plot = SvgCanvas(
      fill: backgroundColor,
      width: width, height: height,
      children: []);

  plot.children.add(Circle(cx: xCenter, cy: yCenter, r: 10, fill: Color.black));

  return plot;
}