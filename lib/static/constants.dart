import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List cuisines = [
  'African',
  'American',
  'British',
  'Cajun',
  'Caribbean',
  'Chinese',
  'Eastern European',
  'European',
  'French',
  'German',
  'Greek',
  'Indian',
  'Irish',
  'Italian',
  'Japanese',
  'Jewish',
  'Korean',
  'Latin American',
  'Mediterranean',
  'Mexican',
  'Middle Eastern',
  'Nordic',
  'Southern',
  'Spanish',
  'Thai',
  'Vietnamese',
];

TextStyle cuisineTextStyle() {
  return TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
}

TextStyle appbarTextStyle() {
  return TextStyle(fontSize: 22, letterSpacing: 1);
}

TextStyle recipeTextStyle() {
  return TextStyle(
    fontSize: 15,
  );
}

TextStyle recipeDetailsTextStyle() {
  return TextStyle(fontSize: 13);
}
