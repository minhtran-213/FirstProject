import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:project_1/constants.dart';
import 'package:project_1/services/upload_file.dart';

class ImageCapture extends StatefulWidget {
  static const routeName = '/image picker';
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _image;
  Future<void> _pickImage(ImageSource imageSource) async {
    File selected = await ImagePicker.pickImage(source: imageSource);
    setState(() {
      _image = selected;
    });
  }

  FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://first-project-b436c.appspot.com/');
  StorageUploadTask _uploadTask;
  void _startUpload() {
    String path = 'images/${DateTime.now()}.png';
    setState(() {
      _uploadTask = _storage.ref().child(path).putFile(_image);
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _image.path,
      toolbarColor: primaryColor,
      ratioX: 1.0,
      ratioY: 1.0,
    );
    setState(() {
      _image = cropped ?? _image;
    });
  }

  void _clear() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Choose Avatar'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _startUpload();
              Navigator.of(context).pop();
            },
            color: Colors.white,
            icon: SvgPicture.asset('assets/images/svg/checked_icon.svg'),
          )
        ],
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          if (_image != null) ...[
            Image.file(_image),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    child: Icon(Icons.crop),
                    onPressed: _cropImage,
                  ),
                  FlatButton(
                    child: Icon(Icons.delete),
                    onPressed: _clear,
                  )
                ],
              ),
            ),
            Uploader(
              file: _image,
              startUpload: _startUpload,
              uploadTask: _uploadTask,
            ),
          ],
        ],
      ),
    );
  }
}
