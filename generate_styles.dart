import 'dart:io';

const colors = [
  'primary',
  'primaryLight',
  'primaryDark',
  'textMain',
  'textSecondary',
  'textSub',
  'textPlaceholder',
  'textNavigation',
  'textDark',
  'danger',
  'rating',
  'white',
  'black',
  'grey',
  'lightgray',
];

const fontWeights = ['light', 'regular', 'medium', 'semiBold', 'bold'];

const fontSizes = [
  7,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  18,
  20,
  22,
  24,
  25,
  26,
  28,
  30,
  38,
];

const outputDir = 'lib/generated';
const outputFile = '$outputDir/style_atoms.dart';

void main() {
  final buffer = StringBuffer();

  buffer.writeln('''
import 'package:flutter/material.dart';

import '../app/core/themes/app_colors.dart';

''');

  // ---------------------------------------------------------------------------
  // Weight Atoms
  // ---------------------------------------------------------------------------

  buffer.writeln('''
extension WeightAtoms on BuildContext {
  TextStyle get style => const TextStyle(
        fontFamily: 'Rubik',
      );
''');

  final weightValues = {
    'light': 'FontWeight.w300',
    'regular': 'FontWeight.w400',
    'medium': 'FontWeight.w500',
    'semiBold': 'FontWeight.w600',
    'bold': 'FontWeight.w700',
  };

  for (final weight in fontWeights) {
    buffer.writeln('''
  TextStyle get $weight => style.copyWith(
        fontWeight: ${weightValues[weight]},
      );
''');
  }

  buffer.writeln('}');

  // ---------------------------------------------------------------------------
  // Color Atoms
  // ---------------------------------------------------------------------------

  buffer.writeln('''
extension ColorAtoms on TextStyle {
''');

  for (final color in colors) {
    buffer.writeln('''
  TextStyle get $color => copyWith(
        color: AppColors.$color,
      );
''');
  }

  buffer.writeln('}');

  // ---------------------------------------------------------------------------
  // Font Size Atoms
  // ---------------------------------------------------------------------------

  buffer.writeln('''
extension FontSizeAtoms on TextStyle {
''');

  for (final size in fontSizes) {
    buffer.writeln('''
  TextStyle get px$size => copyWith(
        fontSize: $size,
      );
''');
  }

  buffer.writeln('}');

  // ---------------------------------------------------------------------------
  // Weight + Font Size
  // ---------------------------------------------------------------------------

  buffer.writeln('''
extension WeightAndPxMixes on BuildContext {
''');

  for (final weight in fontWeights) {
    for (final size in fontSizes) {
      buffer.writeln('''
  TextStyle get ${weight}Px$size => $weight.px$size;
''');
    }
  }

  buffer.writeln('}');

  // ---------------------------------------------------------------------------
  // Weight + Font Size + Color
  // ---------------------------------------------------------------------------

  buffer.writeln('''
extension StyleAtoms on BuildContext {
''');

  for (final weight in fontWeights) {
    for (final size in fontSizes) {
      for (final color in colors) {
        buffer.writeln('''
  TextStyle get $weight$size$color =>
      ${weight}Px$size.$color;
''');
      }
    }
  }

  buffer.writeln('}');

  // ---------------------------------------------------------------------------
  // Generate File
  // ---------------------------------------------------------------------------

  final directory = Directory(outputDir);

  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

  File(outputFile).writeAsStringSync(buffer.toString());
}
