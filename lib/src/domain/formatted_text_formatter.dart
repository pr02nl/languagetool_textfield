import 'package:flutter/widgets.dart';

/// A formatter for text that applies a specific pattern and style.
///
/// This class is used to format text with a given pattern and style.
/// It provides a way to customize the appearance of text in a flexible way.
class FormattedTextFormatter {
  /// A formatter for text that applies a specific pattern and style.
  ///
  /// This class is used to format text with a given pattern and style.
  /// It provides a way to customize the appearance of text in a flexible way.
  ///
  /// [patternChars] - The pattern to be applied to the text.
  /// [style] - The style to be applied to the text.
  const FormattedTextFormatter({
    required this.patternChars,
    required this.style,
  });

  /// The pattern to be applied to the text.
  final String patternChars;

  /// The style to be applied to the text.
  final TextStyle style;

  @override
  String toString() =>
      'FormattedTextFormatter(patternChars: $patternChars, style: $style)';

  /// Creates a new [FormattedTextFormatter] with the given optional properties.
  //
  /// Returns a new formatter with the given [patternChars] and [style]. If any
  /// of these properties are null, the corresponding property from the current
  /// formatter is used instead.
  //
  /// This method is useful for creating a modified version of the current
  /// formatter without creating a new object every time.
  FormattedTextFormatter copyWith({
    String? patternChars,
    TextStyle? style,
  }) {
    return FormattedTextFormatter(
      patternChars: patternChars ?? this.patternChars,
      style: style ?? this.style,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FormattedTextFormatter &&
        other.patternChars == patternChars &&
        other.style == style;
  }

  @override
  int get hashCode => patternChars.hashCode ^ style.hashCode;
}
