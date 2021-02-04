enum Visibility { inherit, visible, hidden, collapse }

extension VisibilityExt on Visibility {
  String get xmlValue {
    switch (this) {
      case Visibility.collapse:
        return 'collapse';
      case Visibility.visible:
        return 'inherit';
      case Visibility.hidden:
        return 'hidden';
      case Visibility.inherit:
        return 'inherit';
    }
    return '';
  }
}
