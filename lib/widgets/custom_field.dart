import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconData icon;
  final void Function(String)? onChanged;
  final VoidCallback? onToggleVisibility;

  const CustomField({
    super.key,
    required this.label,
    this.obscureText = false,
    required this.icon,
    this.onChanged,
    this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: label,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        suffixIcon: onToggleVisibility != null
            ? IconButton(
                icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: onToggleVisibility,
              )
            : null,
      ),
    );
  }
}
