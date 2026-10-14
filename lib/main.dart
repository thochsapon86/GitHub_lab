import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = SharedPreferencesAsync();
  final isDarkMode = await preferences.getBool('isDarkMode') ?? false;

  runApp(MyApp(initialThemeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light));

}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.initialThemeMode});

  final ThemeMode initialThemeMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SharedPreferencesAsync _preferences = SharedPreferencesAsync();
  late ThemeMode _themeMode = widget.initialThemeMode;

  Future<void> _setDarkMode(bool isDarkMode) async {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
    await _preferences.setBool('isDarkMode', isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: MyPage(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _setDarkMode,
      ),
    );
  }
}
 
class MyPage extends StatefulWidget {

  const MyPage({super.key, required this.isDarkMode, required this.onThemeChanged});

  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
 
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

            SwitchListTile(

              title: const Text('โหมดมืด'),

              value: widget.isDarkMode,

              onChanged: widget.onThemeChanged,

            ),

            Text(message),

            ElevatedButton(

              onPressed: () {

                Navigator.push(

                  context,

                  MaterialPageRoute<void>(

                    builder: (context) => ProfilePage(user: user),

                  ),

                );

              },

              child: const Text('Press'),

            ),

          ],

        ),

      ),

    );

  }

}


class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key, required this.user});

  final String user;

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text('Profile')),

      body: Center(

        child: Column(

          mainAxisSize: MainAxisSize.min,

          children: [

            Text(user),

            const SizedBox(height: 16),

            ElevatedButton(

              onPressed: () => Navigator.pop(context),

              child: const Text('ย้อนกลับ'),

            ),

          ],

        ),

      ),

    );

  }

}
