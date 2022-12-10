import 'dart:io';
import 'dart:async';

import 'package:defect_detection/Shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
     final ImagePicker _picker = ImagePicker();

  Future pickImage()async{
 print("i entred pick");
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image==null) return;
    final image_temp=File(image.path);
    setState(() {
          this.image=image_temp;

    });
   
   
    
    }

  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:(AppBar(
        title: Text("Defect Detection",),
      )) ,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Text("Check your image")
              ,
              SizedBox(height: 40,),
              Container(
                height: 108,
                width: 219,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(25),

                ),
                child: MaterialButton(
                  onPressed: ()=>pickImage().then((value) => print("done")),
                  child: SvgPicture.asset("assets/icons/upload_icon.svg")
                  ),

              ),
              image!=null?Image.file(image!,
              width: 300,
              height: 300,
              fit:BoxFit.cover,
              
              ):FlutterLogo(
                size: 250,
              ) ,

            ],
          ),
        ),
      ),
    );
    }

  
}