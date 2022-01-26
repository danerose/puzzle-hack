import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CustomTheme extends Equatable{
  const CustomTheme();
  ThemeData get themeData;
}
