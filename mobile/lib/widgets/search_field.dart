import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/core/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search notes...",
        hintStyle: const TextStyle(
          color: gray300,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        isDense: true,
        contentPadding: EdgeInsets.zero,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 42,
          minHeight: 42,
        ),
        prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
        fillColor: white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: primary,
          ),
        ),
      ),
    );
  }
}
