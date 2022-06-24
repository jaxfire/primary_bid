import 'package:flutter/material.dart';
import 'package:primary_bid/presentation/common/colours.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    required TextEditingController textEditingController,
    required String label,
    required bool enabled,
    required String helperText,
    super.key,
  })  : _textEditingController = textEditingController,
        _label = label,
        _enabled = enabled,
        _helperText = helperText;

  final TextEditingController _textEditingController;
  final String _label;
  final bool _enabled;
  final String _helperText;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _enabled ? 1.0 : 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: TextField(
          enabled: _enabled,
          controller: _textEditingController,
          style: const TextStyle(color: Colours.tertiary),
          decoration: InputDecoration(
            helperText: _helperText,
            labelText: _label,
            labelStyle: const TextStyle(color: Colours.accent),
          ),
          cursorColor: Colours.accent,
        ),
      ),
    );
  }
}