import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'login.dart';
import 'main.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg.png"),
                fit: BoxFit.fill
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border(
                      bottom: BorderSide(width: 2),
                      right: BorderSide(width: 2),
                      left: BorderSide(width: 2),
                      top: BorderSide(width: 2)

                  )
                // color: Colors.orange.withOpacity(30),

              ),
             // color: Colors.grey[300],
              width: (MediaQuery.of(context).size.width)*0.6,
              height:(MediaQuery.of(context).size.height)*0.67 ,
              child: Column(

                //  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Center(
                    child: Text(
                      "Admin",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.purple
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){}, child: Text(
                    "Enter",
                    style:
                    TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent
                    ),
                  )
                  ),
                  SizedBox(height: 50,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: username,
                      decoration: InputDecoration(
                          icon: Icon(Icons.man),
                          hintText: "User Name",
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                              icon: Icon(Icons.password_rounded),
                              hintText: "Password",
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      // Container(
                      //
                      //   child: TextButton(
                      //     onPressed: (){},
                      //     child: Text("Change"),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextButton(onPressed: _changePass,
                        child:Text(
                          "Change",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,

                          ),)
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    error,
                    style:TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.red
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  }, child: Text(
                    "Login as admin",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  )
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }


TextEditingController username=TextEditingController();
TextEditingController password=TextEditingController();


Future<void> _changePass() async {

  Directory directory = await getApplicationDocumentsDirectory();
      String f2='${directory.path}/userName.txt';
      File fName = File(f2);
      String f22='${directory.path}/pass.txt';
      File fPass = File(f22);
      setState(() {
        fName.writeAsString( username.text);
        fPass.writeAsString( password.text);
      });

}

String error="";
}
