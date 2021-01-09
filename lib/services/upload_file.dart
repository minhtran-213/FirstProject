import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project_1/screen/add_member_screen.dart';
import 'package:project_1/screen/detail_screen.dart';

class Uploader extends StatefulWidget {
  final File file;
  final StorageUploadTask uploadTask;

  final Function startUpload;
  Uploader({this.file, this.uploadTask, this.startUpload});
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  @override
  Widget build(BuildContext context) {
    if (widget.uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream: widget.uploadTask.events,
        builder: (context, snapshot) {
          var event = snapshot?.data?.snapshot;
          double progressPercent =
              event != null ? event.bytesTransferred / event.totalByteCount : 0;
          return Column(
            children: [
              if (widget.uploadTask.isComplete) Text('🎇🎇🎇'),
              if (widget.uploadTask.isInProgress)
                FlatButton(
                  child: Icon(Icons.pause),
                  onPressed: widget.uploadTask.pause,
                ),
              if (widget.uploadTask.isPaused)
                FlatButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: widget.uploadTask.resume,
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
        onPressed: widget.startUpload,
      );
    }
  }
}
