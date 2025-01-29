import 'package:flutter/material.dart';
import 'package:languagetool_textfield/src/core/controllers/language_tool_controller.dart';
import 'package:languagetool_textfield/src/utils/mistake_popup.dart';
import 'package:languagetool_textfield/src/utils/popup_overlay_renderer.dart';

/// A TextField widget that checks the grammar using the given
/// [LanguageToolController]
class LanguageToolTextField extends StatefulWidget {
  /// A style to use for the text being edited.
  final TextStyle? style;

  /// A decoration of this [TextField].
  final InputDecoration decoration;

  /// Color scheme to highlight mistakes
  final LanguageToolController controller;

  /// Mistake popup window
  final MistakePopup? mistakePopup;

  /// The maximum number of lines to show at one time, wrapping if necessary.
  final int? maxLines;

  /// The minimum number of lines to occupy when the content spans fewer lines.
  final int? minLines;

  /// Whether this widget's height will be sized to fill its parent.
  final bool expands;

  /// A language code like en-US, de-DE, fr, or auto to guess
  /// the language automatically.
  /// ```language``` = 'auto' by default.
  final String language;

  /// Determine text alignment
  /// textAlign = [TextAlign.start] by default.
  final TextAlign textAlign;

  /// Determine the capitalization behavior of the text field.
  /// [TextCapitalization] = [TextCapitalization.none] by default.
  final TextCapitalization textCapitalization;

  /// A builder for the context menu of the text field.
  ///
  /// If provided, this builder will be used to create the context menu
  /// that appears when the user long-presses on the text field.
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// Determine text Direction
  final TextDirection? textDirection;

  /// Called when the user changes the text in the text field.
  ///
  /// The callback receives the new text as a `String` parameter.
  final ValueChanged<String>? onTextChange;

  /// Called when the user submits the text in the text field.
  ///
  /// The callback receives the submitted text as a `String` parameter.
  final ValueChanged<String>? onTextSubmitted;

  /// Called when the user taps on the text field.
  ///
  /// The callback receives no parameters.
  final VoidCallback? onTap;

  /// Called when the user taps outside the text field.
  ///
  /// The callback receives no parameters.
  final TapRegionCallback? onTapOutside;

  /// The action to perform when the user submits the text field.
  ///
  /// For example, [TextInputAction.done] will close the keyboard when the user
  /// submits the text field.
  final TextInputAction? textInputAction;

  /// The type of keyboard that this text field should display.
  ///
  /// For example, [TextInputType.text] will show a standard keyboard,
  /// while [TextInputType.number] will show a keyboard with numbers.
  final TextInputType? keyboardType;

  /// The color of the cursor in the text field.
  final Color? cursorColor;

  /// Whether the text field should automatically
  /// focus itself when it is displayed.
  /// Defaults to `false`.
  final bool autoFocus;

  /// The focus node to use for the text field.
  ///
  /// If null, a new focus node will be created.
  final FocusNode? focusNode;

  /// The appearance of the keyboard.
  ///
  /// This determines the style of the keyboard that will be displayed when the
  /// text field is focused. For example, [Brightness.light] will display
  /// a light keyboard, while [Brightness.dark] will display a dark keyboard.
  final Brightness? keyboardAppearance;

  /// Whether the text field should automatically correct the user's input
  /// as they type.
  /// When set to `true`, the text field will attempt to correct spelling and
  /// grammar errors as the user types.
  /// When set to `false`, the text field will not automatically correct
  /// the user's input.
  final bool autocorrect;

  /// Whether the text field is read-only.
  ///
  /// When set to `true`, the text field will not allow the user to edit its
  /// contents.
  /// When set to `false`, the text field will allow the user to edit its
  /// contents.
  final bool readOnly;

  /// The cursor that will be displayed when the user hovers over
  /// the text field.
  /// If null, the default cursor will be used.
  final MouseCursor? mouseCursor;

  /// Whether the text field should be centered horizontally.
  ///
  /// When set to `true`, the text field will be centered horizontally.
  /// When set to `false`, the text field will be left-aligned.
  final bool alignCenter;

  /// Creates a widget that checks grammar errors.
  const LanguageToolTextField({
    required this.controller,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.decoration = const InputDecoration(),
    this.language = 'auto',
    this.mistakePopup,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.cursorColor,
    this.autocorrect = true,
    this.autoFocus = false,
    this.readOnly = false,
    this.textInputAction,
    this.keyboardType,
    this.focusNode,
    this.keyboardAppearance,
    this.mouseCursor,
    this.onTap,
    this.onTapOutside,
    this.onTextChange,
    this.onTextSubmitted,
    this.alignCenter = true,
    super.key,
    this.contextMenuBuilder,
  });

  @override
  State<LanguageToolTextField> createState() => _LanguageToolTextFieldState();
}

class _LanguageToolTextFieldState extends State<LanguageToolTextField> {
  FocusNode? _focusNode;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final controller = widget.controller;

    _focusNode = widget.focusNode ?? FocusNode();
    controller.focusNode = _focusNode;
    controller.language = widget.language;
    final defaultPopup = MistakePopup(popupRenderer: PopupOverlayRenderer());
    controller.popupWidget = widget.mistakePopup ?? defaultPopup;

    controller.addListener(_textControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (_, __) {
        final fetchError = widget.controller.fetchError;

        // it would probably look much better if the error would be shown on a
        // dedicated panel with field options
        final httpErrorText = Text(
          '$fetchError',
          style: TextStyle(
            color: widget.controller.highlightStyle.misspellingMistakeColor,
          ),
        );

        final inputDecoration = widget.decoration.copyWith(
          suffix: fetchError != null ? httpErrorText : null,
        );

        Widget childWidget = TextField(
          textCapitalization: widget.textCapitalization,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          focusNode: _focusNode,
          controller: widget.controller,
          scrollController: _scrollController,
          decoration: inputDecoration,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          expands: widget.expands,
          style: widget.style,
          cursorColor: widget.cursorColor,
          autocorrect: widget.autocorrect,
          textInputAction: widget.textInputAction,
          keyboardAppearance: widget.keyboardAppearance,
          keyboardType: widget.keyboardType,
          autofocus: widget.autoFocus,
          readOnly: widget.readOnly,
          mouseCursor: widget.mouseCursor,
          onChanged: widget.onTextChange,
          onSubmitted: widget.onTextSubmitted,
          onTap: widget.onTap,
          onTapOutside: widget.onTapOutside,
          contextMenuBuilder: widget.contextMenuBuilder,
        );

        if (widget.alignCenter) {
          childWidget = Center(child: childWidget);
        }

        return childWidget;
      },
    );
  }

  void _textControllerListener() =>
      widget.controller.scrollOffset = _scrollController.offset;

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode?.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }
}
