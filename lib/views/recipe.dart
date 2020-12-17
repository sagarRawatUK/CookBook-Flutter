import 'dart:convert';
import 'dart:io';

import 'package:cookbook/static/constants.dart';
import 'package:cookbook/views/recipeDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

List<dynamic> recipeData;
bool _isLoading = true;

class Recipe extends StatefulWidget {
  final String cuisine;
  Recipe(this.cuisine);

  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  Future fectchRecipe() async {
    final response = await http.get(
        "https://api.spoonacular.com/recipes/complexSearch?cuisine=" +
            widget.cuisine +
            "&apiKey=API_KEY");
    if (response.statusCode == 200) {
      setState(() {
        var data = jsonDecode(response.body);
        recipeData = data['results'];
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
    fectchRecipe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.cuisine + " Recipes",
          style: GoogleFonts.bangers(textStyle: appbarTextStyle()),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    recipeData.length,
                    (index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecipeDetails(
                                        recipeData[index]['id'].toString(),
                                        recipeData[index]['title'],
                                        recipeData[index]['image'])));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: GridTile(
                              header: Image(
                                  matchTextDirection: true,
                                  height: 110,
                                  image:
                                      NetworkImage(recipeData[index]['image'])),
                              child: SizedBox(
                                height: 1,
                              ),
                              footer: Center(
                                  child: Text(
                                recipeData[index]['title'].toString(),
                                style: GoogleFonts.gochiHand(
                                    textStyle: recipeTextStyle()),
                              )),
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ),
    );
  }
}
