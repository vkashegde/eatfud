import 'package:eatfud/controller/provider/auth_provider/auth_provider.dart';
import 'package:eatfud/firebase_options.dart';
import 'package:eatfud/view/authScreens/mobile_login_screen.dart';
import 'package:eatfud/view/authScreens/otp_screen.dart';
import 'package:eatfud/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eatfud/view/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<MobileAuthProvider>(
              create: (_) => MobileAuthProvider())
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: SplashScreen()),
      );
    });
  }
}
