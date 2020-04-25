import 'package:flutter/material.dart';
import 'package:drd_app/constant.dart';
import '../components/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profileScreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class LoginPage extends StatefulWidget {
  static String id ='login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  bool showSpinner =false ;
  final _auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        padding: EdgeInsetsDirectional.only(top: 10 , bottom: 15),
                        height: 75,
                        width: 75,
                        child: CircleAvatar(backgroundImage: AssetImage('assets/images/logoo.jpg',)),

                      ),
                    ),
                  ),
                  Text('D R detection',
                    style: TextStyle(
                      fontFamily: 'SpicyRice',
                      color: Colors.black,
                      fontSize: 20,
                    ),),
                ],
              ),
              //email & password  field
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle (color: Colors.black),


                textAlign: TextAlign.center,


                onChanged: (value) {
                  //Do something with the user input.
                  email=value;
                },
                decoration:KinputDecor.copyWith(hintText: 'Email Adress') ,

              ),
              SizedBox(height: 10,),
              TextField(
                style: TextStyle (color: Colors.black),
                obscureText: true,

                textAlign: TextAlign.center,


                onChanged: (value) {
                  //Do something with the user input.
                  password=value;
                },
                decoration:KinputDecor.copyWith(hintText: 'Password') ,

              ),
              SizedBox(height: 25,),
              RoundButtonSpecial(
                maColor: Colors.white,
                txt: Text('Login',
                  style:TextStyle(
                      color: Colors.black
                  ) ,),
                func: ()async{
                  setState(() {
                    showSpinner=true;
                  });
                  try{
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(user != null){
                      showSpinner=false;
                      Navigator.pushNamed(context, Profile.id);
                    }

                  }
                  catch(e){
                    showSpinner=false;
                    print(e);
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
