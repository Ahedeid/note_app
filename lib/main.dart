import 'package:flutter/material.dart';
import 'package:note_app/provider/note_service.dart';
import 'package:note_app/provider/userLoggedIn.dart';
import 'package:note_app/routes/app_router.dart';
import 'package:note_app/routes/router_genaretor.dart';
import 'package:note_app/routes/screen_name.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(const NoteApp());
}

class NoteApp extends StatefulWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteService(),
        ),
        ChangeNotifierProvider(create: (_) => AuthProvider()..initPrefs()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
        ),
        title: 'Note App Tutorial',
        onGenerateRoute: RouteGenerator.onGenerateRoute,
         initialRoute: ScreenName.launchScreen,
        navigatorKey: AppRouter.navigatorKey,
      ),
    );
  }
}
