import 'dart:io';

import 'package:file_management/main.dart';
import 'package:file_management/widget.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'homepage.dart';

class UserPage extends StatefulWidget {
  // final viewPhoto;
  // final SavePhoto;


  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // late Future<void> viewPhoto ;
  // late Future<void> SavePhoto;

  late double wid;
  late double hi;

  String filePath="";
  String absPath="";
  @override
  void initState() {

    super.initState();
    // viewPhoto=widget.viewPhoto;
    // SavePhoto=widget.SavePhoto;
  }
  @override
  Widget build(BuildContext context) {
    wid=MediaQuery.of(context).size.width;
    hi=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg.png"),
                    fit: BoxFit.cover
                )
            ),
            width: wid,
            height: hi,
            child:
            Column(
              children:[
                 SizedBox(height: hi*0.2,),
                Container(
                  width: wid*0.8,
                  height: hi*0.6,
                  color: Colors.transparent,
                  child:
                  GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: containers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: 50,
                          child: containers[index]
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                BackButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "Home")));
                  },
                ),
        ]  )

          ),

          //SizedBox(width: wid*0.1,),
        ],
      ),
    );
  }
  String path="";

}