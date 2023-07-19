import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';


import 'package:file_management/main.dart';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';



class ButtonData extends StatelessWidget {
  bool isSelected = false;
  final String name;
  final Widget page;

  ButtonData(this.name, this.page);
  @override
  Widget build(BuildContext context) {
    return page;
  }
}


Container Divs(String fileName,String filePath,Icon icon){
  return Container(
    child: GestureDetector(
      onTap: () async{
        if(await File(filePath).exists()){
        launchUrl(Uri.file(filePath));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(22),
          border: true == true ? Border.all(color: Colors.white, width: 2) : null,
        ),

        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 5,),
            icon,
            SizedBox(width: 5,),
            Expanded(
              child: Text(
                fileName
                ,style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  overflow: TextOverflow.ellipsis
              ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}





