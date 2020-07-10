import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.mdzol.com/u/fotografias/m/2020/3/29/f608x342-29735_59458_3.jpg'),
              radius: 25.0,

            ),
          ),

          Container( //se hace en un conntenedor para poder modificar los margenes
            margin: EdgeInsets.only(right: 18.0),
            child: CircleAvatar(//Avatar circulas
              child: Text('SL'),//Texto
              backgroundColor: Colors.purple,//background
            
            ),

          )

        ],
      ),

      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.mdzol.com/u/fotografias/m/2020/3/29/f608x342-29735_59458_3.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration (milliseconds: 300),
        ),

      ),
    );
  }
}