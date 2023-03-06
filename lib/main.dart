import 'package:flutter/material.dart';
import 'package:note_app/routes/app_router.dart';
import 'package:note_app/routes/router_genaretor.dart';
import 'package:note_app/routes/screen_name.dart';



void main()=> runApp(const NoteApp());


class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme:const AppBarTheme(
          color: Colors.transparent,
        )
      ),
      title: 'Note App Tutorial',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: ScreenName.launchScreen ,
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}