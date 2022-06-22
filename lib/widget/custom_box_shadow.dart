import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customBoxShadow() {
  return [
    BoxShadow(
      color: const Color.fromARGB(17, 0, 0, 0).withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 2), // changes position of shadow
    ),
  ];
}
