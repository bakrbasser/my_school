import 'package:flutter/material.dart';

class AppColors {
  /// Converts a hex color string (e.g. "#123efc", "123efc", "0xFF123efc", or "abc")
  /// into a [Color]. 6-digit hex is treated as opaque (alpha = FF). Throws
  /// [FormatException] for invalid input.
  static Color _fromHex(String hexString) {
    final raw = hexString.replaceAll('#', '').replaceAll('0x', '').trim();
    if (raw.isEmpty) {
      throw FormatException('Empty color string', hexString);
    }

    String hex = raw.toUpperCase();

    // Expand 3-digit shorthand (e.g. "1aF" -> "11AAFF")
    if (hex.length == 3) {
      hex = hex.split('').map((c) => '$c$c').join();
    }

    // If 6-digit provided, assume opaque
    if (hex.length == 6) {
      hex = 'FF$hex';
    }

    if (hex.length != 8) {
      throw FormatException('Invalid hex color length', hexString);
    }

    final intVal = int.parse(hex, radix: 16);
    return Color(intVal);
  }

  static final Color primaryBlue = _fromHex('#137efc');
  static final Color inputBg = _fromHex('F0F2F4FF');
}
