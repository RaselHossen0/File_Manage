


import 'package:file_management/main.dart';
import 'package:file_management/pages.dart';
import 'package:file_management/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ButtonData> buttonsData = [
    ButtonData("Timeline Photos", Pages(icon: Icon(Icons.photo, color: Colors.orange), fileName: "photo", fileContainer: "photoName", container: PhotoContainers, pathList: photoPaths, nameList: photoNames)),
    ButtonData("Audio talks", Pages(icon: Icon(Icons.audio_file, color: Colors.orange), fileName: "audio", fileContainer: "audioName", container: AudioContainers, pathList: audioPaths, nameList: audioNames)),
    ButtonData("Archival print media", Pages(icon: Icon(Icons.print, color: Colors.orange), fileName: "print", fileContainer: "printName", container: PrintContainers, pathList: printPaths, nameList: printNames)),
    ButtonData("Video lectures", Pages(icon: Icon(Icons.video_file, color: Colors.orange), fileName: "video", fileContainer: "videoName", container: VideoContainers, pathList: videoPaths, nameList: videoNames)),
    ButtonData("Rare write-ups", Pages(icon: Icon(Icons.short_text, color: Colors.orange), fileName: "text", fileContainer: "textName", container: TextContainers, pathList: textPaths, nameList: textNames)),
    ButtonData("Yesteryear Letters", Pages(icon: Icon(Icons.pages_rounded, color: Colors.orange), fileName: "letter", fileContainer: "letterName", container: LetterContainers, pathList: letterPaths, nameList: letterNames)),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),

      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                     buttons(buttonsData[0]),
                    buttons(buttonsData[1]),
                    buttons(buttonsData[2]),
                    // buttons("Timeline Photos", Pages( icon: Icon(Icons.photo,color: Colors.orange,), fileName: "photo", fileContainer: "photoName", container: PhotoContainers, pathList: photoPaths, nameList: photoNames)),
                    // buttons("Audio talks", Pages( icon: Icon(Icons.audio_file,color: Colors.orange,), fileName: "audio", fileContainer: "audioName", container: AudioContainers, pathList: audioPaths, nameList: audioNames)),
                    // buttons("Archival print media", Pages( icon: Icon(Icons.print,color: Colors.orange,), fileName: "print", fileContainer: "printName", container: PrintContainers, pathList: printPaths, nameList: printNames)),
                  ]
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttons(buttonsData[3]),
                    buttons(buttonsData[4]),
                    buttons(buttonsData[5]),
                    // buttons("Video lectures",Pages( icon: Icon(Icons.video_file,color: Colors.orange,), fileName: "video", fileContainer: "videoName", container: VideoContainers, pathList: videoPaths, nameList: videoNames)),
                    // buttons("Rare write-ups",Pages( icon: Icon(Icons.short_text,color: Colors.orange,), fileName: "text", fileContainer: "textName", container: TextContainers, pathList: textPaths, nameList: textNames)),
                    // buttons("Yesteryear Letters", Pages( icon: Icon(Icons.pages_rounded,color: Colors.orange,), fileName: "letter", fileContainer: "letterName", container: LetterContainers, pathList: letterPaths, nameList: letterNames)),
                  ]
              ),

            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
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
          ),
        ],
      ),
        ),

    );
  }

  Container buttons (ButtonData buttonData){
    return Container(
      child: MouseRegion(
        onEnter: (_){
          setState(() {
            buttonData.isSelected=true;
          });
        },
        onExit: (_){
          setState(() {
            buttonData.isSelected=false;
          });
        },
        child: Container(
          width: 300,
          height: 50,
          margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
          decoration: BoxDecoration(
              color: buttonData.isSelected==true?Colors.blue:Colors.orange,
              borderRadius: BorderRadius.circular(15),
              //border: Border.all(width: 0.3),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                )
              ]
          ),
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute (
                builder: (BuildContext context) => buttonData.page,)
              );
            },
            child: Text(
              buttonData.name,
              style: TextStyle(
                fontFamily: "Ananda",
                color: Colors.white,
                fontSize: 30,
              ),),
          ),
        ),
      ),
    );
  }

}
