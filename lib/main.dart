import 'dart:io';
import 'package:file_management/homepage.dart';
import 'package:file_management/widget.dart';
import 'package:path/path.dart' as PATH;

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';




List<Container> containers=[];
Future<void> readFileAndPopulateContainers(String filePath, String nameFilePath, List<String> paths, List<String> names, List<Container> containers, List<Container> specificContainers,Icon icon) async {
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
      containers.add(Divs(name, path,icon));
      specificContainers.add(Divs(name, path,icon));
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
       photoPaths, photoNames, containers, PhotoContainers,Icon(Icons.photo,color: Colors.orange,));
   await readFileAndPopulateContainers(
       '${directory.path}/audio.txt', '${directory.path}/audioName.txt',
       audioPaths, audioNames, containers, AudioContainers,Icon(Icons.audio_file,color: Colors.orange,));
   await readFileAndPopulateContainers(
       '${directory.path}/video.txt', '${directory.path}/videoName.txt',
       videoPaths, videoNames, containers, VideoContainers,Icon(Icons.video_file,color: Colors.orange,));
   await readFileAndPopulateContainers(
       '${directory.path}/letter.txt', '${directory.path}/letterName.txt',
       letterPaths, letterNames, containers, LetterContainers,Icon(Icons.text_format,color: Colors.orange,));
   await readFileAndPopulateContainers(
       '${directory.path}/print.txt', '${directory.path}/printName.txt',
       printPaths, printNames, containers, PrintContainers,Icon(Icons.print,color: Colors.orange,));
   await readFileAndPopulateContainers(
       '${directory.path}/text.txt', '${directory.path}/textName.txt',
       textPaths, textNames, containers, TextContainers,Icon(Icons.text_format,color: Colors.orange,));

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



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Hr',)
      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
