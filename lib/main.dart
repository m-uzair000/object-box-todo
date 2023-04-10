import 'package:flutter/material.dart';
import 'package:objet_box_todo/home.dart';
import 'package:objet_box_todo/object_box_helper.dart';
/// Global
ObjectBoxHelper? objectBoxHelper;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBoxHelper = await ObjectBoxHelper.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
