import 'package:cookbook/views/recipe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/static/constants.dart';
import 'package:cookbook/helper/auth.dart';

bool loggedIn = false;

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
          style: appbarTextStyle(),
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
                        var userImage = value.photoURL;
                        loggedIn = true;
                      });
                    });
                  },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: cuisines.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Recipe(cuisines[index])));
                },
                leading: CircleAvatar(
                  radius: 17,
                  child: Text((index + 1).toString()),
                ),
                title: Text(
                  cuisines[index],
                  style: cuisineTextStyle(),
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
