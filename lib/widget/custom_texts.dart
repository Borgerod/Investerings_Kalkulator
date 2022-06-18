import 'package:flutter/material.dart';

titleWhiteBig(text) {
  return Text(
    '$text',
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

titleGreyBig(text) {
  return Text(
    '$text',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 30,
      // fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.6),
    ),
  );
}

noramlGreyText(text) {
  return Text(
    '$text',
    textAlign: TextAlign.left,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      // fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.6),
    ),
  );
}

noramlwhiteText(text) {
  return Text(
    '$text',
    textAlign: TextAlign.left,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      // fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
    ),
  );
}

mediumwhiteText(text) {
  return Text(
    '$text',
    textAlign: TextAlign.left,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      // fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
    ),
  );
}
