import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/places.dart';
import 'places_list_screen.dart';
import './add_places_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Places(),
      child: MaterialApp(
        title: 'Travel Diaries',
        theme: ThemeData(primarySwatch: Colors.pink, accentColor: Colors.amber),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {

  void showAddPlaceScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return AddPlaceScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('Travel Diary'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.add), onPressed: showAddPlaceScreen),
      ],
    );
    double availableHeight = MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: PlaceListScreen(availableHeight),
    );
  }
}
