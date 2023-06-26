import 'dart:io';

import 'package:file_management/main.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Videos extends StatefulWidget {

  Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {

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
            child: Text("Add Video lectures",
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
                    icon: Icon(Icons.text_format),
                    label: Text("Add Video lectures",
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
                      String f5=getAbsoluteFilePath('video.txt');
                      File vid = File(f5);
                      String f6=getAbsoluteFilePath('videoName.txt');
                      File file4 = File(f6);

                      setState(() {
                        vid.writeAsString(absPath+'\n',mode: FileMode.append);
                        file4.writeAsString(path+'\n',mode: FileMode.append);
                      });

                      setState(() {
                        videoPaths.add(absPath);
                        videoNames.add(path);
                        VideoContainers.add(Divs(path, absPath));
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
              itemCount: VideoContainers.length,
              itemBuilder: (BuildContext context, int index) {
                return VideoContainers[index];
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



