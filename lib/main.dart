import 'dart:io';
import 'package:path/path.dart' as PATH;
import 'package:file_management/letter.dart';
import 'package:file_management/photo.dart';
import 'package:file_management/login.dart';
import 'package:file_management/print.dart';
import 'package:file_management/text.dart';
import 'package:file_management/video.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'audio.dart';


List<Container> containers=[];
Future<void> readFileAndPopulateContainers(String filePath, String nameFilePath, List<String> paths, List<String> names, List<Container> containers, List<Container> specificContainers) async {
  File file = File(filePath);
  if (!(await File(filePath).exists())) {
    await file.create();
  }
  String fileContent = await file.readAsString();
  paths.addAll(fileContent.split('\n'));

  File nameFile = File(nameFilePath);
  if (!(await nameFile.exists())) {
    await nameFile.create();
  }
  String nameFileContent = await nameFile.readAsString();
  names.addAll(nameFileContent.split('\n'));

  if (names.isNotEmpty) {
    for (int i = 0; i < names.length; i++) {
      String name = names[i];
      String path = paths[i];
      containers.add(Divs(name, path));
      specificContainers.add(Divs(name, path));
    }
  }
}
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

String getProjectRootFolder() {
  final scriptPath = Platform.script.toFilePath();
  final scriptDirectory = PATH.dirname(scriptPath);
  final projectRootFolder = PATH.dirname(scriptDirectory);
  return projectRootFolder;
}

String getAbsoluteFilePath(String filename) {
  final rootFolder = getProjectRootFolder();
  final filesDirectory = PATH.join(rootFolder, 'file_management/files');
  final absoluteFilePath = PATH.join(filesDirectory, filename);
  return absoluteFilePath;
}

 main() async {
   runApp(const MyApp());
   Directory directory = await getApplicationDocumentsDirectory();

   await readFileAndPopulateContainers(
       '${directory.path}/photo.txt', '${directory.path}/photoName.txt',
       photoPaths, photoNames, containers, PhotoContainers);
   await readFileAndPopulateContainers(
       '${directory.path}/audio.txt', '${directory.path}/audioName.txt',
       audioPaths, audioNames, containers, AudioContainers);
   await readFileAndPopulateContainers(
       '${directory.path}/video.txt', '${directory.path}/videoName.txt',
       videoPaths, videoNames, containers, VideoContainers);
   await readFileAndPopulateContainers(
       '${directory.path}/letter.txt', '${directory.path}/letterName.txt',
       letterPaths, letterNames, containers, LetterContainers);
   await readFileAndPopulateContainers(
       '${directory.path}/print.txt', '${directory.path}/printName.txt',
       printPaths, printNames, containers, PrintContainers);
   await readFileAndPopulateContainers(
       '${directory.path}/text.txt', '${directory.path}/textName.txt',
       textPaths, textNames, containers, TextContainers);

   //  //photo read
   //  String f1='${directory.path}/photo.txt';
   //  File file = File(f1);
   //  if(!(await File(f1).exists())){
   //    file.create();
   //  }
   //  String fileContent = await file.readAsString();
   //  photoPaths = fileContent.split('\n');
   //  String f2='${directory.path}/photoName.txt';
   //  File file1 = File(f2);
   //  if(!(await file1.exists())){
   //    file1.create();
   //  }
   //  String fileContent1 = await file1.readAsString();
   //   photoNames = fileContent1.split('\n');
   //   for(int i=0;i<photoNames.length;i++){
   //
   //     String name=photoNames[i];
   //     String path=photoPaths[i];
   //     containers.add(Divs(name, path));
   //     PhotoContainers.add(Divs(name, path));
   //   }
   //  //audio read
   //
   //  String f3='${directory.path}/audio.txt';
   //  File file2 = File(f3);
   //  if(!(await file2.exists())){
   //    file2.create();
   //  }
   //  String file2Content = await file2.readAsString();
   //  audioPaths = file2Content.split('\n');
   //  String f4='${directory.path}/audioName.txt';
   //  File file3 = File(f4);
   //  if(!(await file3.exists())){
   //    file3.create();
   //  }
   //  String file3Content1 = await file3.readAsString();
   //  audioNames = file3Content1.split('\n');
   //  for(int i=0;i<audioNames.length;i++){
   //    String name=audioNames[i];
   //    String path=audioPaths[i];
   //    containers.add(Divs(name, path));
   //    AudioContainers.add(Divs(name, path));
   //  }
   //
   //
   //
   //  //video read
   //  String f5='${directory.path}/video.txt';
   //  File vid = File(f5);
   //  if(!(await vid.exists())){
   //    vid.create();
   //  }
   //  String vidS = await vid.readAsString();
   //  videoPaths = vidS.split('\n');
   //  String f6='${directory.path}/videoName.txt';
   //  File file4 = File(f6);
   //  if(!(await file4.exists())){
   //    file4.create();
   //  }
   //  String file2Content1 = await file4.readAsString();
   //  videoNames = file2Content1.split('\n');
   //  for(int i=0;i<videoNames.length;i++){
   //    String name=videoNames[i];
   //    String path=videoPaths[i];
   //    containers.add(Divs(name, path));
   //    VideoContainers.add(Divs(name, path));
   //  }
   //
   //  //letter read
   //  String f7='${directory.path}/letter.txt';
   //  File let = File(f7);
   //  if(!(await let.exists())){
   //    let.create();
   //  }
   //  String letS = await vid.readAsString();
   //  letterPaths = vidS.split('\n');
   //  String f8='${directory.path}/letterName.txt';
   //  File letfile = File(f8);
   //  if(!(await letfile.exists())){
   //    letfile.create();
   //  }
   //  String letfile2Content1 = await letfile.readAsString();
   //  letterNames = letfile2Content1.split('\n');
   //  for(int i=0;i<letterNames.length;i++){
   //    String name=letterNames[i];
   //    String path=letterPaths[i];
   //    containers.add(Divs(name, path));
   //    LetterContainers.add(Divs(name, path));
   //  }
   //
   //  //print read
   //  String f9='${directory.path}/print.txt';
   //  File print = File(f9);
   //  if(!(await print.exists())){
   //    print.create();
   //  }
   //  String printS = await print.readAsString();
   //  printPaths = printS.split('\n');
   //  String f10='${directory.path}/printName.txt';
   //  File printfile4 = File(f10);
   //  if(!(await printfile4.exists())){
   //    printfile4.create();
   //  }
   //  String printfile2Content1 = await printfile4.readAsString();
   //  printNames = printfile2Content1.split('\n');
   //  for(int i=0;i<printNames.length;i++){
   //    String name=printNames[i];
   //    String path=printPaths[i];
   //    containers.add(Divs(name, path));
   //    PrintContainers.add(Divs(name, path));
   //  }
   //
   //  //text read
   //  String f11='${directory.path}/text.txt';
   //  File text = File(f11);
   //  if(!(await text.exists())){
   //    text.create();
   //  }
   //  String textS = await text.readAsString();
   //  textPaths = textS.split('\n');
   //  String f12='${directory.path}/textName.txt';
   //  File textfile4 = File(f12);
   //  if(!(await textfile4.exists())){
   //    textfile4.create();
   //  }
   //  String textfile2Content1 = await textfile4.readAsString();
   //  textNames = textfile2Content1.split('\n');
   //  for(int i=0;i<textNames.length;i++){
   //    String name=textNames[i];
   //    String path=textPaths[i];
   //    containers.add(Divs(name, path));
   //    TextContainers.add(Divs(name, path));
   //  }
   //
   //
   // }
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
