import 'package:flutter/material.dart';
import 'package:trading_app/model/users.dart';

class UserProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(height: double.infinity,child: Column(children: [
     Text('User 0',style: TextStyle(color: Colors.white,fontSize: 30),),
     Text('User ID:${user[0].id}',style: TextStyle(color: Colors.white,fontSize: 15),),
     Text('User Balance(\$):${user[0].balances.USD}',style: TextStyle(color: Colors.white,fontSize: 15),),
     Text('User Asset(Google Stocks):${user[0].balances.Google}',style: TextStyle(color: Colors.white,fontSize: 15),),
     SizedBox(height: 40,),
      Text('User 1',style: TextStyle(color: Colors.white,fontSize: 30),),
     Text('User ID:${user[1].id}',style: TextStyle(color: Colors.white,fontSize: 15),),
     Text('User Balance(\$):${user[1].balances.USD}',style: TextStyle(color: Colors.white,fontSize: 15),),
     Text('User Asset(Google Stocks):${user[1].balances.Google}',style: TextStyle(color: Colors.white,fontSize: 15),),
     

     

    ]),);
  }
}