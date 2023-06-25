import 'dart:io';

import 'package:file_management/main.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Photos extends StatefulWidget {

   Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {

  late double wid;
  late double hi;
  String filePath="";
  String absPath="";

  @override
  Widget build(BuildContext context) {
     wid=MediaQuery.of(context).size.width;
     hi=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Add Photos",
              style:TextStyle(
                color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Verdana"
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            color: Colors.orange[400],
            width: wid*0.9,
            height: hi*0.045,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BackButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "Home")));
                },
                ),
                  SizedBox(width: wid*0.1,),
               ElevatedButton.icon(onPressed: ()async{
                 FilePickerResult? res= await FilePicker.platform.pickFiles(
                   dialogTitle: "Choose Photos"
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
                   label: Text("Add Photo",
                   style:TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),
                   )
               ),
                SizedBox(width: wid*0.1,),
                Container(

                  child: Text(
                    path,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.white,
                      fontFamily: "Verdana"
                   // backgroundColor: Colors.deepPurple
                  ),
                  ),
                ),
                SizedBox(width: wid*0.1,),
                ElevatedButton.icon(
                    onPressed: () async {
                      File photoFile=File("files/photo.txt");
                      File photoName=File("files/photoName.txt");
                      setState(() {
                        photoFile.writeAsString(absPath+'\n',mode: FileMode.append);
                        photoName.writeAsString(path+'\n',mode: FileMode.append);
                      });

                  setState(() {
                    photoPaths.add(absPath);
                    photoNames.add(path);
                    containers.add(Divs(path, absPath));
                  }
                  );

                },
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
          SizedBox(height: hi*0.01,),
          Container(
            width: wid*0.9,
            color: Colors.orange[400]?.withOpacity(0.8),
            height: hi*0.8,
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
          )


        ],
      ),
    );
  }
   String path="";


}



