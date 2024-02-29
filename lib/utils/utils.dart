import 'package:flutter/material.dart';

class Utils {
  BuildContext context;
  Utils(this.context);
  Size get getScreenSize => MediaQuery.of(context).size;
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
