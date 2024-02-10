import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';
import 'package:image_picker/image_picker.dart';

class UploadProfileImageView extends StatefulWidget {
  const UploadProfileImageView({Key? key}) : super(key: key);

  @override
  State<UploadProfileImageView> createState() => _UploadProfileImageViewState();
}

class _UploadProfileImageViewState extends State<UploadProfileImageView> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Profile Image'),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: _imageFile == null
                      ? CircleAvatar(
                          // Placeholder profile image when no image is selected
                          backgroundImage: AssetImage(AppImages.lightAppLogo),
                          radius: 60, // Radius of the circle avatar
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(_imageFile!.path)),
                          radius: 60, // Radius of the circle avatar
                        ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Select Image'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  // Handle skip action
                },
                child: Text('Skip'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _imageFile == null
                    ? null
                    : () {
                        // Handle save action
                        if (_imageFile != null) {
                          // Save the profile image
                        }
                      },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
