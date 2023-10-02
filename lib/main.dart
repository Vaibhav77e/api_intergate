import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/myhomepage.dart';
import 'controller/api_response.dart';

void main() {
  runApp(const MyApp());
}

/// url = 'https://fakestoreapi.com/products'
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiResponse(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
