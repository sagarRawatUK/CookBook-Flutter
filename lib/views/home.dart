import 'package:cookbook/views/recipe.dart';
import 'package:cookbook/views/userProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/static/constants.dart';
import 'package:cookbook/helper/auth.dart';
import 'package:google_fonts/google_fonts.dart';

bool loggedIn = false;
String imageUrl = '';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CookBook",
          style: GoogleFonts.bangers(textStyle: appbarTextStyle()),
        ),
        actions: [
          IconButton(
            icon:
                loggedIn ? Icon(Icons.exit_to_app) : Icon(Icons.account_circle),
            onPressed: loggedIn
                ? () {
                    setState(() {
                      AuthService().signOutGoogle();
                      loggedIn = false;
                    });
                  }
                : () {
                    setState(() {
                      AuthService().signin().then((value) {
                        loggedIn = true;
                        imageUrl = value.photoURL;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfile(
                                    value.photoURL,
                                    value.displayName,
                                    value.email)));
                      });
                    });
                  },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: cuisines.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.all(1),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Recipe(cuisines[index])));
                },
                title: Text(
                  cuisines[index],
                  style: GoogleFonts.gochiHand(textStyle: cuisineTextStyle()),
                ),
                trailing:
                    IconButton(icon: Icon(Icons.star_border), onPressed: () {}),
              ),
            );
          },
        ),
      ),
    );
  }
}
