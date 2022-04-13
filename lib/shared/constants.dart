import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  
  fillColor: Colors.white,
  hintStyle: TextStyle(fontFamily: "ProductSans"),
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigo, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigo, width: 2.0),
  ),
);