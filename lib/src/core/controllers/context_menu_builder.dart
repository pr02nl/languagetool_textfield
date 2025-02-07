import 'package:flutter/material.dart';
import 'package:languagetool_textfield/src/core/constants/defaults.dart';
import 'package:languagetool_textfield/src/core/model/context_menu_item.dart';

/// A builder class for creating formatted text context menus.
///
/// This class provides methods for building [AdaptiveTextSelectionToolbar]s
/// with default context menu button items and custom items.
class FormattedTextContextMenuBuilder {
  /// Builds an [AdaptiveTextSelectionToolbar] with the default context menu
  /// button items and the given [items].
  ///
  /// The [items] parameter is optional and defaults to
  /// [FormattedTextDefaults.formattedTextDefaultContextMenuItems].
  ///
  /// The returned [AdaptiveTextSelectionToolbar] contains the default context
  /// menu button items and the given [items].
  ///
  ///
  /// See also:
  ///
  /// * [AdaptiveTextSelectionToolbar]
  /// * [FormattedTextDefaults.formattedTextDefaultContextMenuItems]
  ///
  static AdaptiveTextSelectionToolbar adaptiveTextSelectionToolbar({
    required EditableTextState editableTextState,
    List<FormattedTextContextMenuItem>? items,
  }) {
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: [
        ...editableTextState.contextMenuButtonItems,
        for (final item in items ??
            FormattedTextDefaults.formattedTextDefaultContextMenuItems)
          _buildContextMenuButtonItem(
            editableTextState: editableTextState,
            label: item.label,
            patternChars: item.patternChars,
          ),
      ],
    );
  }

  /// Builds a single [ContextMenuButtonItem] with the given [item] and
  /// [editableTextState] for the given [EditableTextState].
  ///
  /// The returned [ContextMenuButtonItem] is a button that when clicked
  /// will format the selected text with the given [item].
  ///
  /// The [item] parameter is required and must not be null.
  ///
  /// See also:
  ///
  /// * [ContextMenuButtonItem]
  /// * [EditableTextState]
  /// * [FormattedTextContextMenuItem]
  static ContextMenuButtonItem buildContextMenuButtonItem({
    required EditableTextState editableTextState,
    required FormattedTextContextMenuItem item,
  }) {
    return _buildContextMenuButtonItem(
      editableTextState: editableTextState,
      label: item.label,
      patternChars: item.patternChars,
    );
  }

  static ContextMenuButtonItem _buildContextMenuButtonItem({
    required EditableTextState editableTextState,
    required String label,
    required String patternChars,
  }) {
    return ContextMenuButtonItem(
      onPressed: () {
        final TextEditingValue value = editableTextState.textEditingValue;

        editableTextState.updateEditingValue(
          TextEditingValue(
            text: '''
              ${value.selection.textBefore(value.text)}
              $patternChars
              ${value.selection.textInside(value.text)}
              $patternChars
              ${value.selection.textAfter(value.text)}
            ''',
            selection: TextSelection.collapsed(
              offset: value.selection.end + (2 * patternChars.length),
            ),
          ),
        );
      },
      label: label,
    );
  }
}
