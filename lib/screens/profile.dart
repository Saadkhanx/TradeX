import 'package:flutter/material.dart';
import 'package:trading_app/widgets/user_profile.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[900],
      appBar: AppBar(
          title: Text('Profile', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey[800]),body: Center(child: UserProfile()));
  }
}