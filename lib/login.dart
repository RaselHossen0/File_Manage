import 'dart:convert';
import 'dart:io';

import 'package:file_management/changePassword.dart';

import 'package:file_management/user.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
              SizedBox(height: 40,),
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

                width: (MediaQuery.of(context).size.width)*0.6,
              height:(MediaQuery.of(context).size.height)*0.7 ,
              child: Column(

              //  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  Center(
                    child: Text(
                      "Are you User?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                            ,fontSize: 25
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserPage()));
                  }, child: Text(
                    "Enter",
                    style:
                    TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,

                    ),
                  )
                  ),
                  Center(
                    child: Text(
                      "If you are Admin",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                      ),
                    ),
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
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextButton(onPressed: login,
                        child:Text(
                          "Login",
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
                  ) ,
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder:(context)=> ChangePass()
                    ));
                  }, child: Text(
                    "Change password",
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
  int p=0;
  int u=0;
  Future<void> login() async {
    String nam=username.text;
    String pass=password.text;
    Directory directory=await getApplicationDocumentsDirectory();
    String pp="${directory.path}/pass.txt";
    File Fi=File(pp);
    if(!(await Fi.exists())){
      setState(() {
        Fi.create();
        Fi.writeAsString("1234");
      });

    }
    File re=File("${directory.path}/userName.txt");
    if(!(await re.exists())){
      setState(() {
        re.create();
        re.writeAsString("admin");
      });

    }
   await Fi.readAsString(encoding: utf8).then((value){
     if(value==pass) {
       setState(() {
         p=1;
       });
     }
    });
    await re.readAsString(encoding: utf8).then((value){
      if(value==nam) {
        setState(() {
          u=1;
        });
      }
    });

    // String f2=getAbsoluteFilePath('pass.txt');
    // File file1 = File(f2);
    // await file1.readAsString().then((String Pass) {
    //
    //   if(Pass==pass) {
    //     setState(() {
    //       p=1;
    //     });
    //   }
    // });
    // String f22=getAbsoluteFilePath('userName.txt');
    // File file11 = File(f22);
    // await file11.readAsString().then((String uNam) {
    //
    //   if(uNam==nam) {
    //     setState(() {
    //       u=1;
    //     });
    //
    //   }
    // });
    //

    if(u==1 && p==1) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "Home")
      ));
    }

      else{
        setState(() {
           error="Please provide correct credentials!";
        });
      }
    }




String error="";
}

