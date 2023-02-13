import 'package:flutter/material.dart';

class BarVerticalScreen extends StatefulWidget {
  const BarVerticalScreen({Key? key}) : super(key: key);

  @override
  _BarVerticalScreenState createState() =>
      _BarVerticalScreenState();
}

class _BarVerticalScreenState extends State<BarVerticalScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        body:  Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  icon: Column(
                    children: [Icon(Icons.favorite_border), Text('Button 1')],
                  ),
                  selectedIcon: Container(
                    color: Colors.green,
                    child: Column(
                      children: [Icon(Icons.favorite_border), Text('Button 1')],
                    ),
                  ),
                  label: Text(""),
                ),
                NavigationRailDestination(
                  icon: Column(
                    children: [Icon(Icons.bookmark_border), Text('Button 2')],
                  ),
                  selectedIcon: Column(
                    children: [Icon(Icons.book), Text('2 clicked')],
                  ),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Third'),
                ),
              ],
            ),
            VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Text('selectedIndex: $_selectedIndex'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );;
  }

}