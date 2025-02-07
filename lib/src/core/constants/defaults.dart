import 'package:flutter/widgets.dart';
import 'package:languagetool_textfield/src/core/controllers/context_menu_builder.dart';
import 'package:languagetool_textfield/src/core/model/context_menu_item.dart';
import 'package:languagetool_textfield/src/core/model/toolbar_action.dart';
import 'package:languagetool_textfield/src/domain/formatted_text_formatter.dart';

/// A mixin that provides default values for formatted text.
///
/// This mixin provides default values for context menu items and formatters
/// for formatted text.
mixin FormattedTextDefaults {
  /// A list of default context menu items for formatted text.
  ///
  /// These items provide common formatting options, such as bold, italic, and
  /// strikethrough.
  static const List<FormattedTextContextMenuItem>
      formattedTextDefaultContextMenuItems = [
    FormattedTextContextMenuItem(
      patternChars: '*',
      label: 'Bold',
    ),
    FormattedTextContextMenuItem(
      patternChars: '_',
      label: 'Italic',
    ),
    FormattedTextContextMenuItem(
      patternChars: '~',
      label: 'Strikethrough',
    ),
    FormattedTextContextMenuItem(
      patternChars: '#',
      label: 'Underline',
    ),
  ];

  /// A list of default formatters for formatted text.
  ///
  /// These formatters provide common text styles, such as bold, italic, and
  /// strikethrough.
  static const List<FormattedTextFormatter> formattedTextDefaultFormatters = [
    FormattedTextFormatter(
      patternChars: '*',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    FormattedTextFormatter(
      patternChars: '_',
      style: TextStyle(fontStyle: FontStyle.italic),
    ),
    FormattedTextFormatter(
      patternChars: '~',
      style: TextStyle(decoration: TextDecoration.lineThrough),
    ),
    FormattedTextFormatter(
      patternChars: '#',
      style: TextStyle(decoration: TextDecoration.underline),
    ),
  ];

  /// A list of default toolbar actions for formatted text.
  ///
  /// These actions provide common text styles, such as bold, italic, and
  /// strikethrough.
  static const List<FormattedTextToolbarAction>
      formattedTextToolbarDefaultActions = [
    FormattedTextToolbarAction(
      patternChars: '*',
      label: 'Bold',
    ),
    FormattedTextToolbarAction(
      patternChars: '_',
      label: 'Italic',
    ),
    FormattedTextToolbarAction(
      patternChars: '~',
      label: 'Strikethrough',
    ),
    FormattedTextToolbarAction(
      patternChars: '#',
      label: 'Underline',
    ),
  ];

  /// Returns a list of default context menu button items for formatted text.
  ///
  /// This function takes an [EditableTextState] as input and returns a list of
  /// [ContextMenuButtonItem]s that can be used to format text.
  ///
  /// Parameters:
  ///   editableTextState: The current state of the editable text.
  ///
  /// Returns:
  ///   A list of [ContextMenuButtonItem]s for formatting text.
  static List<ContextMenuButtonItem> formattedTextDefaultContextMenuButtonItems(
    EditableTextState editableTextState,
  ) =>
      formattedTextDefaultContextMenuItems
          .map(
            (item) =>
                FormattedTextContextMenuBuilder.buildContextMenuButtonItem(
              editableTextState: editableTextState,
              item: item,
            ),
          )
          .toList();
}
