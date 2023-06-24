import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {

  late double wid;
  late double hi;
  String filePath="";

  @override
  Widget build(BuildContext context) {
     wid=MediaQuery.of(context).size.width;
     hi=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70,

            decoration:  BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
             // gradient: LinearGradient(colors: [Colors.orange,Colors.yellow])
            ),
            margin: EdgeInsets.only(top: 10),
            child: Text("Add Photos",
              style:TextStyle(
                color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Verdana"
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            color: Colors.purple[200],
           // width: wid*0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(width: wid*0.1,),
               ElevatedButton.icon(onPressed: ()async{
                 FilePickerResult? res= await FilePicker.platform.pickFiles(
                   dialogTitle: "Choose Photos"
                 );
                 PlatformFile? file=res?.files.first;
                  filePath=res?.files.single.path! as String;
              //    print(filePath);

                 setState(() {
                   path=file!.name!;
                 });


               },
                   icon: Icon(Icons.add_a_photo),
                   label: Text("Add Photo",
                   style:TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     //fontFamily: "Verdana"
                   ),
                   )
               ),
                SizedBox(width: wid*0.1,),
                Text(
                  path,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Colors.white,
                    fontFamily: "Verdana"
                 // backgroundColor: Colors.deepPurple
                ),
                ),
                SizedBox(width: wid*0.1,),
                ElevatedButton.icon(
                    onPressed: () async {
                  Directory appDir=await getApplicationDocumentsDirectory();
                  String copyPath=  "${appDir.path}/$path";
                  File file= File(filePath!);
                  try{
                    await file.copy(copyPath);
                  }
                  catch(e){

                  }

                  // File savedFile= File(filePath);


                  setState(() {
                    paths.add(divs(path));
                  });

                },
                    icon: Icon(Icons.save),
                    label: Text("Save",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Verdana"

                  ),
                    )
                )


              ],
            ),
          ),
          SizedBox(height: hi*0.01,),
          Expanded(
            child: Container(
              width: wid*0.9,
              color: Colors.orange[400]?.withOpacity(0.8),
              height: hi*10,
              child: ListView.builder(
                itemCount: paths.length,
                itemBuilder: (BuildContext context, int index) {
                  return paths[index];
                },

              ),
            ),
          )


        ],
      ),
    );
  }
   String path="";
   List<Container> paths=[];
  Container divs(String fileName){
    return Container(
      height: hi*0.09,
      padding: EdgeInsets.only(top: 15,bottom: 15),

      decoration: BoxDecoration(
        color: Colors.white60.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
              // offset: Offset(20,.3),
          // blurRadius: 10,
          // spreadRadius: 10,
          color: Colors.orangeAccent
          )
        ],
      ),

          child:
          ElevatedButton.icon(
            
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(2),
              backgroundColor: MaterialStateProperty.all(Colors.grey[700]),
              
            ),
              onPressed: () async {
                Directory appDir=await getApplicationDocumentsDirectory();
                String filePath = "${appDir.path}/$path";
                File sFile=File(filePath);
                //print(filePath);
                if(await File(filePath).exists()){
                  launchUrl(Uri.file(filePath));
                }
                else{
                  print("Not Exitst");
                }

          },

              icon: Icon(Icons.photo),
              label: Text(
                fileName
                ,style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w900
              ),
              ),
          )




    )
    ;
  }
}



