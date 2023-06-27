import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload{
  XFile? pickedImg;
  final ImagePicker _picker = ImagePicker();
  int? imageQuality;
  XFile? _imageFile;

  bool isImageGood() {
    return _imageFile !=null;
  }


  void _pickImg(ImageSource source, void Function(XFile pickedImg) imgPickFn) async {
    final pickedImgFile = await _picker.pickImage(source: source, imageQuality: imageQuality);
    if (pickedImgFile !=null){
      pickedImg = XFile(pickedImgFile.path);
      imgPickFn(XFile(pickedImgFile.path));
    }
  }


  Future<Widget?> checkImageQuality(int imageQuality) async{
    if (imageQuality >= 50){
      return Container (
        child: Text('looks better'),
      );
    } else {
      return null;
    }
  }

  uploadImage(context, void Function(XFile pickedImg) imgPickFn){
    return showModalBottomSheet(
      context: context,
      builder: (context) => SelectOptions(
        child: Column(
          children: [
            TextButton.icon(
              onPressed: (){
                Navigator.pop(context);
                _pickImg(ImageSource.camera, imgPickFn);
              }, icon: const Icon(Icons.photo_camera),
              label: const Text('add image'),),
            TextButton.icon(
              onPressed: (){
                Navigator.pop(context);
                _pickImg(ImageSource.gallery, imgPickFn);
              }, icon: const Icon(Icons.imagesearch_roller_outlined),
              label: const Text('add image from gallery'),),
          ],
        ),
      ),);
  }
}

class SelectOptions extends StatelessWidget {
  const SelectOptions({Key? key, required this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Container(
        height: 130,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}