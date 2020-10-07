import 'package:animated_bottombar_flutter/providers/provider.dart';
import 'package:animated_bottombar_flutter/pages/landing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Envolve material app in a ChangeNotifierProvider to update our provider
    return ChangeNotifierProvider(
      create: (_) => ProviderApp(),
      child:  MaterialApp(
        title: 'Material App',
        home: Landing()
      ),
    );
  }
}