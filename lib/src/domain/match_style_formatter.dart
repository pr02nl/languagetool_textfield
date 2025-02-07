import 'package:flutter/widgets.dart';

/// A formatter for text styles in a match.
///
/// This class represents a text style formatter used in a match. It provides
/// methods to format text with a specific style and offset.
class MatchStyleFormatter {
  /// The message associated with this [MatchStyleFormatter].
  final String message;

  /// The text style associated with this [MatchStyleFormatter].
  final TextStyle style;

  /// The offset associated with this [MatchStyleFormatter].
  final int offset;

  /// The offset associated with this [MatchStyleFormatter].
  final int length;

  /// A formatter for text styles in a match.
  ///
  /// This class represents a text style formatter used in a match. It provides
  /// methods to format text with a specific style and offset.
  MatchStyleFormatter({
    required this.message,
    required this.style,
    required this.offset,
    required this.length,
  });

  /// Creates a copy of this `MatchStyleFormatter` with the given fields
  /// replaced by the new values provided. If a field is not provided, the
  /// existing value is retained.
  MatchStyleFormatter copyWith({
    String? message,
    TextStyle? style,
    int? offset,
    int? length,
  }) {
    return MatchStyleFormatter(
      message: message ?? this.message,
      style: style ?? this.style,
      offset: offset ?? this.offset,
      length: length ?? this.length,
    );
  }
}
