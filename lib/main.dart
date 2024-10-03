import 'package:flutter/material.dart';
import './pages/LoginPage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp();

  @override
 Widget build(BuildContext){
  return MaterialApp(
    title: "Latihan Kuis",
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: LoginPage(),
  );
 }
}