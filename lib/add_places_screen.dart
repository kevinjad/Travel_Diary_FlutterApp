import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import './providers/places.dart';
import './photo_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  _AddPlaceScreen createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  TextEditingController titleController = TextEditingController();
  File pickedImage;

  void _selectImage(File pickedImage){
    this.pickedImage=pickedImage;
  }

  void _addPlaces(){
    if(titleController.text != '' && pickedImage!=null){
      Provider.of<Places>(context).addPlace(titleController.text, this.pickedImage);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('Add a Place'),
    );
    double availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: availableHeight,
        color: Colors.blueGrey[400],
        child: Card(
          margin: EdgeInsets.all(20),
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Place title',
                  ),
                ),
                Container(margin: EdgeInsets.all(10),child: PhotoPicker(this._selectImage)),
                Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Add'),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
