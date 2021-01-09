import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project_1/screen/add_member_screen.dart';
import 'package:project_1/screen/detail_screen.dart';

class Uploader extends StatefulWidget {
  final File file;
  Uploader({this.file});
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://first-project-b436c.appspot.com/');
  StorageUploadTask _uploadTask;
  void _startUpload() {
    String path = 'images/${DateTime.now()}.png';
    setState(() {
      _uploadTask = _storage.ref().child(path).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream: _uploadTask.events,
        builder: (context, snapshot) {
          var event = snapshot?.data?.snapshot;
          double progressPercent =
              event != null ? event.bytesTransferred / event.totalByteCount : 0;
          return Column(
            children: [
              if (_uploadTask.isComplete) Text('🎇🎇🎇'),
              if (_uploadTask.isInProgress)
                FlatButton(
                  child: Icon(Icons.pause),
                  onPressed: _uploadTask.pause,
                ),
              if (_uploadTask.isPaused)
                FlatButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: _uploadTask.resume,
                ),
              FlatButton(
                child: Text('Complete'),
                onPressed: () {
                  Navigator.of(context).pushNamed(CreateMember.routeName,
                      arguments: {'imageUrl': widget.file.path});
                  print(widget.file.path);
                },
              ),
            ],
          );
        },
      );
    } else {
      return FlatButton.icon(
        label: Text('Upload'),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );
    }
  }
}
