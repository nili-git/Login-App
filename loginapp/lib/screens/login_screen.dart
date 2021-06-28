import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginapp/config/config.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
  
 final FirebaseAuth _auth = FirebaseAuth.instance; 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
         width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 80,),
         child: Column(
         
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:80),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF00F58D),
                    blurRadius: 30,
                    offset: Offset(10,10),
                    spreadRadius:0,
                  ),
                ],
              ),
              child: Image(
                image: AssetImage("assets/login1.png"),
                width: 200,
                height: 200,
              ),
            ),

          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text("Login",
            style: TextStyle(
              fontSize: 30,
            ),
            )),

         Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top:40,),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: " Email",
                  hintText: " Write Email Here",
                 ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

              Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top:10,),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: " Password",
                  hintText: " Write Password Here",
                 ),
                obscureText: true,
              ),
            ),

          
             InkWell(
               onTap: () {
               //  _signIn();
               },
               child: Container(
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    secondaryColor,
                  ],
                   ),
                   borderRadius: BorderRadius.circular(8),
                 ),
                 width: MediaQuery.of(context).size.width,
                 margin: EdgeInsets.symmetric(horizontal: 30, vertical:20,),
                 padding: EdgeInsets.symmetric(horizontal:30, vertical:20,),
                 child: Center(child: Text("Login With Email")),
               ),
                ),

          // Padding(
          //   padding: EdgeInsets.only(top: 10.0),),
         FlatButton(
           onPressed: () {}, 
           child: Text(" Signup using Email"),
           ),  

           SizedBox(height: 10),

           Wrap(
             children: <Widget>[
               FlatButton.icon(
                 onPressed: () {}, 
                 icon: Icon(FontAwesomeIcons.google, color: Colors.red,),
                 label: Text("Sign-In using Gmail",
                 style: TextStyle(color: Colors.red,),),
                 ),
                 SizedBox( width: 100,),

               FlatButton.icon(
                 onPressed: () {}, 
                 icon: Icon(Icons.phone, color: Colors.blue,),
                 label: Text("Sign-In using Phone",
                 style: TextStyle(
                   color: Colors.blue,
                 ),),
                 ),

             ],
             ),  
           
            


          ],
          ),
          ),
      
    );
  }

 void _signIn() async{
  String email = _emailController.text.trim();
  String password = _passwordController.text;
  if(email.isNotEmpty && password.isNotEmpty){
  _auth.signInWithEmailAndPassword(
     email: email, 
     password: password).then((user){
      showDialog(
      context: context, 
      builder: (ctx) {
       return AlertDialog( 
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(16),
         ),
         title: Text("Done"),
         content: Text("Sign in sucess"),
         actions: <Widget>[
           FlatButton(
             onPressed: () {
               Navigator.of(context).pop();
             }, 
             child: Text("Cancel"),
             ),
               FlatButton(
             onPressed: () {
               _emailController.text = " ";
               _passwordController.text = " ";
               Navigator.of(context).pop();
             }, 
             child: Text("Ok"),
             ),
         ],
       );
      }
      );


     })
     .catchError((e){
     showDialog(
      context: context, 
      builder: (ctx) {
       return AlertDialog( 
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(16),
         ),
         title: Text("Error"),
         content: Text("${e.message}"),
         actions: <Widget>[
           FlatButton(
             onPressed: () {
               Navigator.of(context).pop();
             }, 
             child: Text("Cancel"),
             ),
               FlatButton(
             onPressed: () {
               _emailController.text = " ";
               _passwordController.text = " ";
               Navigator.of(context).pop();
             }, 
             child: Text("Ok"),
             ),
         ],
       );
      }
      );
     });
  } else {
    showDialog(
      context: context, 
      builder: (ctx) {
       return AlertDialog( 
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(16),
         ),
         title: Text("Error"),
         content: Text("Please provide email and password.."),
         actions: <Widget>[
           FlatButton(
             onPressed: () {
               Navigator.of(context).pop();
             }, 
             child: Text("Cancel"),
             ),
               FlatButton(
             onPressed: () {
               _emailController.text = " ";
               _passwordController.text = " ";
               Navigator.of(context).pop();
             }, 
             child: Text("Ok"),
             ),
         ],
       );
      }
 );
 }

 
}
}
