import 'package:banana_project/banana.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

   static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>()!;


}

class _MyAppState extends State<MyApp> {

  ThemeMode themeMode = ThemeMode.light;

  changeTheme(){

    setState(() {
      
      themeMode =
        themeMode == ThemeMode.light ?
        ThemeMode.dark : ThemeMode.light;

    });

  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: themeMode == ThemeMode.light ? const SystemUiOverlayStyle(
              
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,

          ) : const SystemUiOverlayStyle(
              
              systemNavigationBarColor: Colors.black,
              systemNavigationBarIconBrightness: Brightness.light,
              
          ),

      child: MaterialApp(
        
        title: 'Flutter Demo',

        themeMode: themeMode,

        theme: ThemeData(

          primarySwatch: Colors.yellow,
          scaffoldBackgroundColor: Colors.white,

          appBarTheme: const AppBarTheme(

            systemOverlayStyle: SystemUiOverlayStyle(
              
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:Brightness.dark
            )

          )
        ),

        darkTheme: ThemeData(

          brightness: Brightness.dark,
          primarySwatch: Colors.yellow,
          accentColor: Colors.yellow,

          appBarTheme: const AppBarTheme(

            systemOverlayStyle: SystemUiOverlayStyle(
              
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,


            )

          )
        ),

        home: const MyHomePage(title: 'Flutter Demo Home Page'),

      )

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
      appBar: AppBar(

        title: const Text("Cool banana"),
        elevation: 0.5,

      ),
      body: Center(

        child: Column(

          children: [
            
            Container(
              height: 100,
            ),
            
            const BananaAnimation(),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          MyApp.of(context).changeTheme();

        },
        tooltip: 'Increment',
        child: const Icon(Icons.dark_mode),
      ),

    );
  }
}
