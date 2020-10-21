import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:titokclone/variable.dart';

class AddVideo extends StatefulWidget {
  @override
  _AddVideoState createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  pickVideo(ImageSource src) async {
    Navigator.pop(context);
    final video = await ImagePicker().getVideo(source: src);
  }

  showOptionDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () => pickVideo(ImageSource.gallery),
              child: Text(
                "Gallery",
                style: mystyle(20),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => pickVideo(ImageSource.camera),
              child: Text(
                "Camera",
                style: mystyle(20),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: mystyle(20),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => showOptionDialog(),
        child: Center(
          child: Container(
            width: 180,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.red[200],
            ),
            child: Center(
                child: Text(
              "Add Video",
              style: mystyle(30),
            )),
          ),
        ),
      ),
    );
  }
}
