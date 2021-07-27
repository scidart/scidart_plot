/// SVG TextAnchor enum.
enum TextAnchor { start, middle, end, inherit }

/// SVG TextAnchor extension, make pattern and conversion easy.
extension TextAnchorExt on TextAnchor {
  String get xmlValue {
    switch (this) {
      case TextAnchor.start:
        return 'start';
      case TextAnchor.middle:
        return 'middle';
      case TextAnchor.end:
        return 'end';
      case TextAnchor.inherit:
        return 'inherit';
    }
  }
}
