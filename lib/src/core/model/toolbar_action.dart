/// A toolbar action for formatted text.
///
/// This class represents a toolbar action that can be used to format text.
/// It has two properties: [label] and [patternChars].
class FormattedTextToolbarAction {
  /// Creates a new instance of [FormattedTextToolbarAction].
  const FormattedTextToolbarAction({
    required this.label,
    required this.patternChars,
  });

  /// The label for this toolbar action.
  final String label;

  /// The pattern characters for this toolbar action.
  final String patternChars;

  /// Creates a copy of this [FormattedTextToolbarAction] with the given
  /// fields replaced by the new values provided. If a field is not provided,
  /// the existing value is retained.
  FormattedTextToolbarAction copyWith({
    String? label,
    String? patternChars,
  }) {
    return FormattedTextToolbarAction(
      label: label ?? this.label,
      patternChars: patternChars ?? this.patternChars,
    );
  }

  @override
  String toString() =>
      'FormattedTextToolbarAction(label: $label, patternChars: $patternChars)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FormattedTextToolbarAction &&
        other.label == label &&
        other.patternChars == patternChars;
  }

  @override
  int get hashCode => label.hashCode ^ patternChars.hashCode;
}
