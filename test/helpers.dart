import 'package:scidart_io/scidart_io.dart';
import 'package:scidart_plot/src/svg/svg.dart';

/// Save the SVG in a file
/// [fileName] the file name, if extension '.svg' is not informed,
/// it is added automatically
Future<void> saveSvg(SvgCanvas svgCanvas, String fileName) async {
  const extension = '.svg';
  if (!fileName.toLowerCase().endsWith(extension)) {
    fileName += extension;
  }
  await writeTxt(svgCanvas.toXML(), fileName);
}
