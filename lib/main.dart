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

}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: const SystemUiOverlayStyle(
        
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,


      ),

      child: MaterialApp(
        
        title: 'Flutter Demo',

        theme: ThemeData(

          primarySwatch: Colors.yellow,
          scaffoldBackgroundColor: Colors.white,

          appBarTheme: const AppBarTheme(

            systemOverlayStyle: SystemUiOverlayStyle(
              
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,

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
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

    );
  }
}
