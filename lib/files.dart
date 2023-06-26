import 'dart:io';

import 'package:path_provider/path_provider.dart';

class MyFiles {
  MyFiles()  {

  }
  void MYFiles() async {
    Directory directory=await getApplicationDocumentsDirectory();
    String pp="${directory.path}/text.txt";
    File text=File(pp);
    if(!(await text.exists())){
      text.create();
    }
    String pp1="${directory.path}/textName.txt";
    File textNames=File(pp1);
    if(!(await textNames.exists())){
      textNames.create();
    }
    String pp11="${directory.path}/videoName.txt";
    File videoName=File(pp11);
    if(!(await textNames.exists())){
      textNames.create();
    }
  }


}