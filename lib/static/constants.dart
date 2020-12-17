import 'package:flutter/cupertino.dart';

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
    fontSize: 18,
    letterSpacing: 1,
    fontWeight: FontWeight.w500,
  );
}

TextStyle appbarTextStyle() {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 22);
}

TextStyle recipeTextStyle() {
  return TextStyle(fontSize: 13, fontWeight: FontWeight.w500);
}

TextStyle recipeDetailsTextStyle() {
  return TextStyle(fontSize: 15);
}
