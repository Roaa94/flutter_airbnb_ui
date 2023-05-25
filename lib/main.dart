import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_airbnb_ui/home_page.dart';
import 'package:flutter_airbnb_ui/widgets/book_flip_demo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      for (var i = 1; i <= 6; i++) {
        precacheImage(
          Image.asset('assets/images/listing-$i.jpg').image,
          context,
        );
      }
      for (var i = 1; i <= 3; i++) {
        precacheImage(
          Image.asset('assets/images/person-$i.jpeg').image,
          context,
        );
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Airbnb Book Flip Interaction',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
