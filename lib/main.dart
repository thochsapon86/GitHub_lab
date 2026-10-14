import 'package:flutter/material.dart';
 
void main() {

  runApp(const MaterialApp(home: MyPage()));

}
 
class MyPage extends StatefulWidget {

  const MyPage({super.key});
 
  @override

  State<MyPage> createState() => _MyPageState();

}
 
class _MyPageState extends State<MyPage> {

  String message = 'ยังไม่ได้กดปุ่ม';
  String user = 'tatsapon';
  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text('GitHub Lab')),

      body: Center(

        child: Column(

          mainAxisSize: MainAxisSize.min,

          children: [

            Text(message),

            ElevatedButton(

              onPressed: () {

                setState(() {

                  message = 'Welcome $user!';

                });

              },

              child: Text('กดฉันสิ $user'),

            ),

          ],

        ),

      ),

    );

  }

}
 