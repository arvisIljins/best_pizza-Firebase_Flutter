import 'package:flutter/material.dart';

const textInputDecorations = InputDecoration(
  labelStyle: TextStyle(
    color: Colors.blueGrey,
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blueGrey,
      width: 2,
    ),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey),
  ),
);
