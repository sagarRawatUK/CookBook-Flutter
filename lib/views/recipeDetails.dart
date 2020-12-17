import 'dart:convert';

import 'package:cookbook/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

var recipeDetails;
var recipeSteps;
List<dynamic> ingredients;
String steps;
bool _isLoading = true;

class RecipeDetails extends StatefulWidget {
  final String recipeId;
  final String recipeTitle;
  final String recipeImage;
  RecipeDetails(this.recipeId, this.recipeTitle, this.recipeImage);
  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  Future fetchRecipeDetails() async {
    final response = await http.get(
      "https://api.spoonacular.com/recipes/" +
          widget.recipeId.toString() +
          "/information?includeNutrition=false&apiKey=38119c6d8b2f4b3c92d20a99ca6350eb",
    );
    if (response.statusCode == 200) {
      setState(() {
        recipeDetails = jsonDecode(response.body);
        ingredients = recipeDetails['extendedIngredients'];
        _isLoading = false;
      });
    } else {
      print(response.statusCode.toString());
    }
  }

  Future fetchRecipeSteps() async {
    final response = await http.get(
      "https://api.spoonacular.com/recipes/" +
          widget.recipeId.toString() +
          "/analyzedInstructions?stepBreakdown=false&apiKey=38119c6d8b2f4b3c92d20a99ca6350eb",
    );
    if (response.statusCode == 200) {
      setState(() {
        recipeSteps = jsonDecode(response.body);
        steps = recipeSteps[0]['steps'][0]['step'];
        print(steps.toString());
        _isLoading = false;
      });
    } else {
      print(response.statusCode.toString());
    }
  }

  @override
  void dispose() {
    // recipeData.clear();
    super.dispose();
  }

  @override
  void initState() {
    // fetchRecipeDetails();
    fetchRecipeSteps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.recipeTitle,
              style: GoogleFonts.bangers(textStyle: appbarTextStyle()))),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  children: [
                    Image(image: NetworkImage(widget.recipeImage)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      steps,
                      style: GoogleFonts.rockSalt(
                          textStyle: recipeDetailsTextStyle()),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
