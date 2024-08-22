import 'package:lastchat/chat_screen.dart';
import 'package:lastchat/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting app',
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          if(snapshot.hasData){
            return ChatScreen();
          }
          return LoginSignupScreen();
        } ,
      ),
    );
  }
}
