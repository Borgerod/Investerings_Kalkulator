import 'package:investerings_kalkulator/utilities/color_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customBoxShadow() {
  return [
    BoxShadow(
      color: colorShadow,
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 1), // changes position of shadow
    ),
  ];
}
