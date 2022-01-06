import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/pages/home_page.dart';
import 'package:suitmedia_test/pages/home_page_vm.dart';
import 'package:suitmedia_test/pages/second_page_vm.dart';
import 'package:suitmedia_test/pages/third_page_vm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomePageViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => SecondPageViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThirdPageViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Suitmedia Test',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const HomePage(),
      ),
    );
  }
}
