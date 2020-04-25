import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  static String id = 'Profile' ;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth =FirebaseAuth.instance;
  FirebaseUser loggedInUSer ;
  void getCurrentUser ()async{
    try{
      final user = await _auth.currentUser();
      if(user!=null){
        loggedInUSer=user;
        print(loggedInUSer.email);
      }
    }
    catch(e){
      print(e);
    }



  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Hero(
                tag: 'logo',
                child: Container(
                  //padding: EdgeInsetsDirectional.only(top: 10 , bottom: 15),
                  padding: EdgeInsets.all(5),
                  height: 50,
                  width: 50,
                  child: CircleAvatar(backgroundImage: AssetImage('assets/images/logoo.jpg',)),

                ),
              ),
              Text('D R detection',
                style: TextStyle(
                  fontFamily: 'SpicyRice',
                  color: Colors.white,
                  fontSize: 20,
                ),),
            ],
          ),
          actions: <Widget>[
        IconButton(
        icon: const Icon(Icons.exit_to_app),
        tooltip: 'Next page',
        onPressed: () {
          _auth.signOut();
          Navigator.pop(context);
        },
        )],

        ),
        body: Text('hello'),
      ),
    );
  }
}
