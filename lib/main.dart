import 'package:file_management/allPages.dart';
import 'package:file_management/login.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = User();
  await user.loadUser();
  runApp(const MyApp());

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
     body: Column(
       children: [
         SizedBox(height: 30,),
         Center(

           child: const Text(
             "Vivekananda Digital Archives, RKMVERI"
           ,style:  TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 25,
               color: Colors.orange
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
             TextButton(
               onPressed: () {
                 Navigator.push(context, MaterialPageRoute (
                   builder: (BuildContext context) => const Photos(),)
                 );
           },
               child: Text("Timeline Photos"),
           ),
             TextButton(
               onPressed: () {


               },
               child: Text(" Audio talks"),
             ),
    ]
         ),
         Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               TextButton(
                 onPressed: () async{

                 },
                 child: Text("Archival print media "),
               ),
               TextButton(
                 onPressed: () async{

                 },
                 child: Text("Video lectures"),
               ),
             ]
         ),
         Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               TextButton(
                 onPressed: () {

                 },
                 child: Text("Rare write-ups"),
               ),
               TextButton(
                 onPressed: () async{

                 },
                 child: Text("Yesteryear Letters "),
               ),
             ]
         ),

       ],
     ),

   );
  }
 
}
