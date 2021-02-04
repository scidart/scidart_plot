enum Unit { px, per, em }

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
    return 'px';
  }
}
