import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drd_app/constant.dart';
import '../components/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profileScreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegisterPage extends StatefulWidget {
  static String id ='register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth =FirebaseAuth.instance;
  final _firestore=Firestore.instance;
  String email;
  String password;
  String name;
  String role="doctor";
  bool showSpinner=false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              //email & password &name field
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
              SizedBox(height: 10,),
              TextField(
                style: TextStyle (color: Colors.black),


                textAlign: TextAlign.center,


                onChanged: (value) {
                  //Do something with the user input.
                  name=value;
                },
                decoration:KinputDecor.copyWith(hintText: 'your Name') ,

              ),
              SizedBox(height: 5,),
              //role
              Column(
                children: <Widget>[
                  Text('Your role : ',style: TextStyle(
                    fontSize: 20 ,

                  ),),
                  SizedBox(height: 8,),
                  Container(
                    height: 30,
                    child: CupertinoPicker(
                      itemExtent: 20,
                      onSelectedItemChanged: (int index){
                        if(index == 0 ){

                          role='doctor';
                        }
                        else{
                          role='user';
                        }
                      },

                      children: <Widget>[
                        Text('Doctor'),
                        Text('User')
                      ],
                    ),
                  ),
                ],
              ),



              SizedBox(height: 25,),
              RoundButtonSpecial(
                maColor: Colors.white,
                txt: Text('Register',
                  style:TextStyle(
                      color: Colors.black
                  ) ,),
                func: ()async{
                  setState(() {
                    showSpinner=true;

                  });
                  print('$email and $role and $name  1');
                  try{
                    print('$email and $role and $name  2');
                    await _firestore.collection('users').add({
                      'role':role,
                      'name':name,
                      'userEmail':email

                    });
                    final newUser =await _auth.createUserWithEmailAndPassword(email: email, password: password);

                    if (newUser != null){
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
