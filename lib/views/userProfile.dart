import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final String userImage;
  final String userName;
  final String userEmail;
  UserProfile(this.userImage, this.userName, this.userEmail);
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName + '\'s Profile'),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(),
              margin: EdgeInsets.symmetric(vertical: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image.network(
                  widget.userImage,
                  scale: 0.8,
                ),
              ),
            ),
          ),
          Text(widget.userEmail)
        ],
      ),
    );
  }
}
