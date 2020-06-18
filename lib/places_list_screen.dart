import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/places.dart';

class PlaceListScreen extends StatelessWidget{
  final double availableHeight;
PlaceListScreen(this.availableHeight);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: availableHeight,
      child: Consumer<Places>(child: Center(child:Text('No Places :(')),builder: (ctx,plc,ch){
        return plc.places.length == 0 ? ch : ListView.builder(itemBuilder: null);
      }),
    );
  }
}