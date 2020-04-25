import 'package:drd_app/screens/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../components/buttons.dart';
import 'package:drd_app/screens/registerScreen.dart';



class WelcomeScreen extends StatelessWidget {
  static const id = 'WelcomSceen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage('assets/images/mountains.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100,),
            Hero(
              tag: 'logo',
              child: Container(
                padding: EdgeInsetsDirectional.only(top: 10 , bottom: 15),
                height: 100,
                width: 100,
                child:CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logoo.jpg',),),),
            ),
            Container(
              child: Text('D R detection',
                style: TextStyle(
                  fontFamily: 'SpicyRice',
                  color: Colors.black,
                ),),
            ),
            SizedBox(height: 100,),
            RoundButtonSpecial(
              maColor: Colors.white,
              txt: Text('Login',
              style:TextStyle(
                color: Colors.black
              ) ,),
              func: (){Navigator.pushNamed(context, LoginPage.id);},
            ),
            RoundButtonSpecial(
              maColor: Colors.white,
              txt: Text('Register',
                style:TextStyle(
                    color: Colors.black
                ) ,),
              func: (){Navigator.pushNamed(context, RegisterPage.id);},
            ),




          ],
        ) ,

      ),
    );
  }
}
