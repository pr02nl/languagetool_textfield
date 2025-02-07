/// A context menu item that represents a formatted text option.
///
/// This class holds the label and pattern characters for a formatted text
/// context menu item.
class FormattedTextContextMenuItem {
  /// Creates a new [FormattedTextContextMenuItem] with the given label and
  /// pattern characters.
  ///
  /// [label] is the text to display for the context menu item.
  /// [patternChars] are the pattern characters for the formatted text context
  /// menu item.
  const FormattedTextContextMenuItem({
    required this.label,
    required this.patternChars,
  });

  /// The label text for the context menu item.
  final String label;

  /// The pattern characters for the formatted text context menu item.
  final String patternChars;

  /// Creates a copy of this [FormattedTextContextMenuItem] with the given
  /// fields replaced by the new values provided. If a field is not provided,
  /// the existing value is retained.
  FormattedTextContextMenuItem copyWith({
    String? label,
    String? patternChars,
  }) {
    return FormattedTextContextMenuItem(
      label: label ?? this.label,
      patternChars: patternChars ?? this.patternChars,
    );
  }

  @override
  String toString() =>
      'FormattedTextContextMenuItem(label: $label, patternChars: $patternChars)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FormattedTextContextMenuItem &&
        other.label == label &&
        other.patternChars == patternChars;
  }

  @override
  int get hashCode => label.hashCode ^ patternChars.hashCode;
}
