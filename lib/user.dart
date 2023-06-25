import 'dart:io';

import 'package:file_management/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'main.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // Future<List<String>> _readFile() async{
  //   File file = File('files/photo.txt');
  //   String fileContent = await file.readAsString() as String;
  //   List<String> lines = fileContent.split('\n');
  //   print(lines);
  //   return lines;
  // }
  @override
  Widget build(BuildContext context) {
    // _readFile();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(

              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width*0.8,
              color: Colors.deepOrange[100],

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },),
                  SizedBox(width: MediaQuery.of(context).size.width*0.35,),
                  Center(child: Apptext("Browse")),
                ],
              ),

            ),
          ),
          SizedBox(height: 30,),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.orange[400]?.withOpacity(0.8),
              height: MediaQuery.of(context).size.height * 0.8, // Set a specific height or constraints
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: containers.length,
                itemBuilder: (BuildContext context, int index) {
                  return containers[index];
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }



}
class Apptext extends Text{
  Apptext(super.data);
  @override
  Widget build(BuildContext context) {

    return Text(
     data!,
    style: TextStyle(
      fontSize: 28,
      // fontWeight: FontWeight.bold,
      fontFamily: "ArchivoBlack-Regular",
      color: Colors.black,
      letterSpacing: 1.2
    ),);
  }

}
