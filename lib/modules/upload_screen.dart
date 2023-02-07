import 'dart:io';
import 'dart:async';
import 'package:flutter_tflite/flutter_tflite.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
    setState(() {

    });
  }
     final ImagePicker _picker = ImagePicker();
  var decision="no result";
  var percentage=0.0;
  var check_done=false;

  Future pickImage()async{
 print("i entred pick");
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image==null) return;
    final image_temp=File(image.path);
    setState(() {
          this.image=image_temp;

    });
   
   
    
    }

     loadModel()async{
       String? res = await Tflite.loadModel(
           model: "assets/model_unquant.tflite",
           labels: "assets/labels.txt",
           numThreads: 1, // defaults to 1
           isAsset: true, // defaults to true, set to false to load resources outside assets
           useGpuDelegate: false // defaults to false, set to true to use GPU delegate
       );

     }
     classifyImage()async{
       var recognitions = await Tflite.runModelOnImage(
           path: image!.path,   // required
           imageMean: 127.5,   // defaults to 117.0
           imageStd: 127.5,  // defaults to 1.0
           numResults: 2,    // defaults to 5
           threshold: 0.5,   // defaults to 0.1
           asynch: true      // defaults to true
       );

       decision=recognitions![0]['label'];
       percentage=recognitions[0]['confidence'];
       decision=decision.substring(2);
       print(decision);
       print(percentage);
       check_done=true;
       setState(() {

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
              SizedBox(height: 20,),
              Container(
                height: 70,
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
          SizedBox(height: 30,)
          ,
              image!=null?Image.file(image!,
              width: 200,
              height: 200,
              fit:BoxFit.cover,


              ):FlutterLogo(
                size: 100,
              ) ,
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: MaterialButton(onPressed: ()=>classifyImage() ,child: Text("check",style:TextStyle(color: Colors.white),),))
            ,
            SizedBox(height: 20,)
            ,decision=="Defected"?Text("Defected Product !",style: TextStyle(
                color: Colors.red,
                fontSize: 30
              ),):Text(decision,style: TextStyle(
                  color: Colors.green,
                  fontSize: 30
              ),
              ),
             check_done!=false? Row(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text("with Confidence level :")),
                  Text(percentage.toString()),

                ],
              ):Row()

            ],
          ),
        ),
      ),
    );
    }

  
}