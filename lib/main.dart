import 'dart:io';

import 'package:file_management/letter.dart';
import 'package:file_management/photo.dart';
import 'package:file_management/login.dart';
import 'package:file_management/print.dart';
import 'package:file_management/text.dart';
import 'package:file_management/video.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'audio.dart';


List<Container> containers=[];

List<Container> AudioContainers=[];
List<String> audioNames=[];
List<String> audioPaths=[];

List<Container> PhotoContainers=[];
List<String> photoNames=[];
List<String> photoPaths=[];

List<Container> LetterContainers=[];
List<String> letterNames=[];
List<String> letterPaths=[];

List<Container> VideoContainers=[];
List<String> videoNames=[];
List<String> videoPaths=[];

List<Container> TextContainers=[];
List<String> textNames=[];
List<String> textPaths=[];

List<Container> PrintContainers=[];
List<String> printNames=[];
List<String> printPaths=[];

 main() async {
  runApp(const MyApp());
  //photo read
  File file = File('files/photo.txt');
  String fileContent = await file.readAsString() as String;
  photoPaths = fileContent.split('\n');
  File file1 = File('files/photoName.txt');
  String fileContent1 = await file1.readAsString() as String;
   photoNames = fileContent1.split('\n');
   for(int i=0;i<photoNames.length;i++){
     String name=photoNames[i];
     String path=photoPaths[i];
     containers.add(Divs(name, path));
     PhotoContainers.add(Divs(name, path));
   }
  //audio read
  File file2 = File('files/audio.txt');
  String file2Content = await file2.readAsString();
  audioPaths = file2Content.split('\n');
  File file3 = File('files/audioName.txt');
  String file3Content1 = await file3.readAsString();
  audioNames = file3Content1.split('\n');
  for(int i=0;i<audioNames.length;i++){
    String name=audioNames[i];
    String path=audioPaths[i];
    containers.add(Divs(name, path));
    AudioContainers.add(Divs(name, path));
  }


  //video read
  File vid = File('files/video.txt');
  String vidS = await vid.readAsString();
  videoPaths = vidS.split('\n');
  File file4 = File('files/videoName.txt');
  String file2Content1 = await file4.readAsString();
  videoNames = file2Content1.split('\n');
  for(int i=0;i<videoNames.length;i++){
    String name=videoNames[i];
    String path=videoPaths[i];
    containers.add(Divs(name, path));
    VideoContainers.add(Divs(name, path));
  }

  //letter read
  File let = File('files/letter.txt');
  String letS = await vid.readAsString();
  letterPaths = vidS.split('\n');
  File letfile4 = File('files/letterName.txt');
  String letfile2Content1 = await letfile4.readAsString();
  letterNames = letfile2Content1.split('\n');
  for(int i=0;i<letterNames.length;i++){
    String name=letterNames[i];
    String path=letterPaths[i];
    containers.add(Divs(name, path));
    LetterContainers.add(Divs(name, path));
  }

  //print read
  File print = File('files/print.txt');
  String printS = await print.readAsString();
  printPaths = printS.split('\n');
  File printfile4 = File('files/printName.txt');
  String printfile2Content1 = await printfile4.readAsString();
  printNames = printfile2Content1.split('\n');
  for(int i=0;i<printNames.length;i++){
    String name=printNames[i];
    String path=printPaths[i];
    containers.add(Divs(name, path));
    PrintContainers.add(Divs(name, path));
  }

  //text read
  File text = File('files/text.txt');
  String textS = await text.readAsString();
  textPaths = textS.split('\n');
  File textfile4 = File('files/textName.txt');
  String textfile2Content1 = await textfile4.readAsString();
  textNames = textfile2Content1.split('\n');
  for(int i=0;i<textNames.length;i++){
    String name=textNames[i];
    String path=textPaths[i];
    containers.add(Divs(name, path));
    TextContainers.add(Divs(name, path));
  }


 }

Container Divs(String fileName,String filePath){
   return Container(
       height: 30,
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



   );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage()
      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage('images/bg.jpg'),
           fit: BoxFit.cover,
         ),
       ),
       // width: MediaQuery.of(context).size.width*0.9,
       // height: MediaQuery.of(context).size.height*0.9,
      // color: Colors.grey[400],
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(height: 30,),
           Center(

             child: const Text(
               "Vivekananda Digital Archives, RKMVERI"
             ,style:  TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 35,
                 color: Colors.teal
               ),
             ),
           ),
           Center(

             child: const Text(
               "Glimpses of the Holy Treasure through"
               ,style:  TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 30,
                 color: Colors.black87
             ),
             ),
           ),
           SizedBox(height: 30,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               buttons("Timeline Photos", Photos()),
               buttons("Audio talks", Audios()),
    ]
           ),
           Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 buttons("Archival print media", Prints()),
                 buttons("Video lectures", Videos()),
               ]
           ),
           Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 buttons("Rare write-ups", Texts()),
                 buttons("Yesteryear Letters", Letters()),
               ]
           ),
           BackButton(onPressed: (){

             Navigator.push(context,
             MaterialPageRoute(builder: (context)=>LoginPage()));
           },
           style:ButtonStyle(
             backgroundColor:MaterialStateProperty.resolveWith<Color?>(
                   (Set<MaterialState> states) {
                 if (states.contains(MaterialState.pressed)) {
                   return Colors.blue.withOpacity(0.8);
                 } else if (states.contains(MaterialState.hovered)) {
                   return Colors.blue.withOpacity(0.5);
                 } else {
                   return Colors.blue;
                 }
               },
           ) ,
           ),
           )
         ]
       ),
     ),

   );
  }

  Container buttons (String name,Widget page){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          //border: Border.all(width: 0.3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: .2,
            )
          ]
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute (
            builder: (BuildContext context) => page,)
          );
        },
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),),
      ),
    );
  }
 
}
