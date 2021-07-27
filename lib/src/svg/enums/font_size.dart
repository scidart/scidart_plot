import 'package:scidart_plot/src/svg/enums/unit.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/unit_converter.dart';

class FontSize {
  String _value = 'medium';

  FontSize(String value) {
    _value = value;
  }

  static final none = FontSize('medium');
  static final small = FontSize('small');
  static final medium = FontSize('medium');
  static final big = FontSize('big');

  static FontSize custom(double value, Unit unit) {
    return FontSize(roundPixels(value, unit));
  }

  static String toXml(FontSize? fontSize) {
    return fontSize?._value ?? FontSize.none._value;
  }
}
