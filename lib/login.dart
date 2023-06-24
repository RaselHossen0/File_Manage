import 'package:file_management/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
                color: Colors.grey[300],
                width: (MediaQuery.of(context).size.width)*0.6,
              height:(MediaQuery.of(context).size.height)*0.8 ,
              child: Column(

              //  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  Center(
                    child: Text(
                      "Are you User?",
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
                  Center(
                    child: Text(
                      "If you are Admin",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black
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
                  TextButton(onPressed: (){}, child: Text(
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
  List<User> users=[User()];
  Future<void> login() async {
    String nam=username.text;
    String pass=password.text;
    for(User user in users){
      if(user.pass==pass && user.name==nam){
        Navigator.push(context, MaterialPageRoute(
            builder:(context)=>
              MyHomePage(title: 'My',)

        )
        );
      }
      else{
        setState(() {
           error="Please provide correct credentials!";
        });
      }
    }

  }
  Future<void> _changePass() async {

  }
}
String error="";
  class User {
  static const _kNameKey = 'name';
  static const _kPassKey = 'pass';

  String name = "admin";
  String pass = "12345678";

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString(_kNameKey) ?? name;
    pass = prefs.getString(_kPassKey) ?? pass;
  }

  Future<void> saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kNameKey, name);
    await prefs.setString(_kPassKey, pass);
  }

  void setPass(String pass) {
    this.pass = pass;
    saveUser();
  }

  void setUser(String name) {
    this.name = name;
    saveUser();
  }
}

