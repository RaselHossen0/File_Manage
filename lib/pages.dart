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

class Pages extends StatefulWidget {
  // final viewPhoto;
  // final SavePhoto;
  final icon;
  final fileName;
  final fileContainer;
  final container;
  final List<String> pathList;
  final List<String> nameList;

   Pages({super.key,required this.icon,required this.fileName, required this.fileContainer, required this.container, required this.pathList, required this.nameList});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  // late Future<void> viewPhoto ;
  // late Future<void> SavePhoto;
  late Icon icon;
  late String fileName;
  late String fileContainer;
  late List<Container> container;
  late double wid;
  late double hi;
  late List<String> pathList;
  late List<String> nameList;
  String filePath="";
  String absPath="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // viewPhoto=widget.viewPhoto;
    // SavePhoto=widget.SavePhoto;
    icon=widget.icon;
    fileName=widget.fileName;
    fileContainer=widget.fileContainer;
    container=widget.container;
    pathList=widget.pathList;
    nameList=widget.nameList;
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
                SizedBox(height: hi*0.095,),
                Container(
                  width: wid*0.9,
                  height: hi*0.045,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      ElevatedButton.icon(
                        onPressed: () async{
                          FilePickerResult? res= await FilePicker.platform.pickFiles(
                              dialogTitle: "Choose Video lectures"
                          );
                          setState(() {
                            absPath=res!.paths.first.toString();
                          });

                          PlatformFile? file=res?.files.first;

                          setState(() {
                            path=file!.name!;
                          });

                        },
                          icon: Icon(Icons.add_a_photo),
                          label: Text("Upload",
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ),
                      SizedBox(width: wid*0.1,),

                      ElevatedButton.icon(
                          onPressed:() async {

                              Directory directory = await getApplicationDocumentsDirectory();
                              String f9='${directory.path}/$fileName.txt';
                              File print = File(f9);
                              String f10='${directory.path}/$fileContainer.txt';
                              File printfile4 = File(f10);

                              setState(() {
                                print.writeAsString(absPath+'\n',mode: FileMode.append);
                                printfile4.writeAsString(path+'\n',mode: FileMode.append);
                              });

                              setState(() {
                                pathList.add(absPath);
                                nameList.add(path);
                                container.add(Divs(path, absPath,icon));
                                containers.add(Divs(path, absPath,icon));
                              }
                              );


                           }
                              ,
                          icon: Icon(Icons.save),
                          label: Text("Save",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "Verdana"
                            ),
                          )
                      )


                    ],
                  ),
                ),
                SizedBox(height: hi*0.038,),
                Container(
                  width: wid*0.8,
                  height: hi*0.6,
                  color: Colors.transparent,
                  child:
                  GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: container.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 50,
                          child: container[index]
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                    ),
                  ),
                ),
                BackButton(
                  onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "Home")));
                },
                ),
                SizedBox(width: wid*0.1,),
              ],
            ),
          )


        ],
      ),
    );
  }
   String path="";

  Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
      {
        String fontFamily = "Verdana",
        TextOverflow overflow = TextOverflow.ellipsis,
        TextDecoration decoration = TextDecoration.none,
        FontWeight fontWeight = FontWeight.normal,
        TextAlign textAlign = TextAlign.start,
        txtHeight}) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          decoration: decoration,
          fontSize: fontSize,
          fontStyle: FontStyle.normal,
          color: fontColor,
          fontFamily: fontFamily,
          height: txtHeight,
          fontWeight: fontWeight),
      maxLines: maxLine,
      softWrap: true,
      textAlign: textAlign,
    );
  }


}