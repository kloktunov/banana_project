import 'package:banana_project/banana.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:animated_icon/animate_icon.dart';
import 'package:animated_icon/animate_icons.dart';

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

        debugShowCheckedModeBanner: false,

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

  void handlePress(){
    print("some");
  }


  @override
  Widget build(BuildContext context) {

    const iconSize = 25.0;
    const iconPadding = 10.0;

    return Scaffold(

      appBar: AppBar(

        title: const Text("Cool banana"),
        elevation: 0.5,

        actions: [

          Container(
            padding: EdgeInsets.all(10),
            child: AnimateIcon(
              onTap: MyApp.of(context).changeTheme,
              iconType: IconType.toggleIcon,
              height: 35,
              width: 35,
              color: Theme.of(context).iconTheme.color ?? Colors.white,
              animateIcon: AnimateIcons.dayNightWeather,
            )
          )
          
        ],

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

      bottomNavigationBar: CurvedNavigationBar(
        color: Theme.of(context).primaryColor,

        backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,

        animationDuration:
          const Duration(milliseconds: 300),


        items: const [
          Icon(UniconsLine.home_alt, size: iconSize),
          Icon(UniconsLine.compass, size: iconSize),
          Icon(UniconsLine.comment, size: iconSize),
          Icon(UniconsLine.user, size: iconSize),
          Icon(UniconsLine.bars, size: iconSize),
        ].map((e) => Padding(
          padding: const EdgeInsets.all(iconPadding),
          child: e)).toList(),

        onTap: (index) {
          
        },

      ),

      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(

        child: const Icon(UniconsLine.plus),
        distance: 100,
        childrenOffset: const Offset(10, 10),

        children: [

          FloatingActionButton(
            heroTag: null,
            child: Icon(UniconsLine.image),
            onPressed: handlePress,
          ),
          FloatingActionButton(
            heroTag: null,
            child: Icon(UniconsLine.video),
            onPressed: handlePress,
          ),
          FloatingActionButton(
            heroTag: null,
            child: Icon(UniconsLine.file),
            onPressed: handlePress,
          ),
         
        ],

      ),


    );
  }
}
