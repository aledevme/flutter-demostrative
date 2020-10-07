import 'package:animated_bottombar_flutter/pages/add.dart';
import 'package:animated_bottombar_flutter/pages/explorer.dart';
import 'package:animated_bottombar_flutter/pages/home.dart';
import 'package:animated_bottombar_flutter/pages/profile.dart';
import 'package:animated_bottombar_flutter/pages/store.dart';
import 'package:animated_bottombar_flutter/providers/provider.dart';
import 'package:animated_bottombar_flutter/widgets/animated_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Landing extends StatefulWidget {

  final List<BarItem> barItems = [
    BarItem(name:'Home', icon: Icons.home),
    BarItem(name:'store', icon: Icons.store),
    BarItem(name: '', icon: Icons.add),
    BarItem(name:'Explore', icon:Icons.explore),
    BarItem(name:'Profile', icon:Icons.person)
  ];
  
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool showNavigationBar = false;
  @override
  Widget build(BuildContext context) {
  var providerApp = Provider.of<ProviderApp>(context);
  final controller = PageController(
    initialPage: providerApp.currentPage
  );

  return Scaffold(
    body: PageView(
      controller: controller,
      children: [
        Home(),
        Store(),
        Add(),
        Explorer(),
        Profile()
      ],
      physics: NeverScrollableScrollPhysics()
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon( showNavigationBar ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down ),
      onPressed: (){
        setState(() {
          showNavigationBar = !showNavigationBar;
        });
      },
    ),
    bottomNavigationBar: showNavigationBar ? AnimatedBottomBar(
      controller: controller,
      barItems: widget.barItems,
      animationDuration: Duration(milliseconds: 50)
      ) : null
    );
  }
}