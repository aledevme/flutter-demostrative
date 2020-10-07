import 'package:animated_bottombar_flutter/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedBottomBar extends StatefulWidget {

  final List <BarItem> barItems;
  final Duration animationDuration;
  final PageController controller;

  AnimatedBottomBar({
    this.barItems,
    this.animationDuration = const Duration(milliseconds: 500),
    this.controller
  });


  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    var providerApp = Provider.of<ProviderApp>(context);

    return Material(
      elevation: 10,
      child:  Padding(
        padding: EdgeInsets.only(
          bottom:32,
          left:16,
          top:16,
          right:16
        ),
        child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildBarItems(providerApp)
        ),
      ),
    );
  }

  List<Widget>_buildBarItems(ProviderApp providerApp){
    List<Widget> _barItems = List();
    
    for(int i=0; i< widget.barItems.length; i++){
      bool isSelected = providerApp.currentPage == i;
      BarItem item = widget.barItems[i];
        _barItems.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: (){
            setState(() {
              providerApp.currentPage = i;
              widget.controller.animateToPage(i, curve:Curves.easeIn, duration: Duration(milliseconds: 300));
            });
          },
          child: AnimatedContainer(
            duration: widget.animationDuration,
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10
            ),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
              children: [
                Icon(item.icon, color: isSelected ? Colors.white : Colors.black),
                SizedBox(width: 5),
                AnimatedSize(
                  duration: widget.animationDuration,
                  curve: Curves.easeOut,
                  vsync: this,
                  child: Text(isSelected ? item.name : '',  style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black, 
                  fontWeight: FontWeight.w600
                )),
                )
              ],
            ),
          )
        )
      );
    }

    return _barItems;
  }
}

class BarItem {
  String name;
  IconData icon;
  Color color;

  BarItem({
    this.name, this.icon, this.color
  });
}