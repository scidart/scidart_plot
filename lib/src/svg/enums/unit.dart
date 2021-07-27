/// SVG length Unit enum.
enum Unit { px, per, em }

/// SVG length Unit extension, make the conversion easy.
extension UnitExt on Unit {
  String get xmlValue {
    switch (this) {
      case Unit.px:
        return 'px';
      case Unit.per:
        return '%';
      case Unit.em:
        return 'em';
    }
  }
}
