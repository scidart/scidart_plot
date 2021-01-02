enum TextAnchor { start, middle, end }

extension TextAnchorExt on TextAnchor {
  String get xmlValue {
    switch (this) {
      case TextAnchor.start:
        return 'start';
      case TextAnchor.middle:
        return 'middle';
      case TextAnchor.end:
        return 'end';
    }
    return 'start';
  }
}