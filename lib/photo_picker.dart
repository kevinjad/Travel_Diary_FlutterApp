import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPaths;
import 'dart:io';

class PhotoPicker extends StatefulWidget {
  final Function _selectImage;
  PhotoPicker(this._selectImage);
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<PhotoPicker> {
  File _imageSelected;
  final picker = ImagePicker();

  Future<void> _imageLoad() async {
    final _imgFile = await picker.getImage(source:ImageSource.camera,maxWidth: 600);
    setState(() {
      _imageSelected=File(_imgFile.path);
    });
    final appDir = await sysPaths.getApplicationDocumentsDirectory();
    final _fileName = path.basename(_imgFile.path);
    final savedImage = await _imageSelected.copy('${appDir}/${_fileName}');
    widget._selectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1)
          ),
          height: 100,
          width: 100,
          child: _imageSelected != null
              ? Image.file(
                  _imageSelected,
                  fit: BoxFit.fill,
                  width: double.infinity,
                )
              : Center(child: Text('Add a photo')),
        ),
        Spacer(),
        FlatButton.icon(
            onPressed: () {_imageLoad();},
            icon: Icon(Icons.camera),
            label: Text('Take a Photo')),
      ],
    );
  }
}
