import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker();

  @override
  void initState(){
    super.initState();
    loadModel().then((value){
      setState(() {

      });
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5
    );
    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel() async{
    await Tflite.loadModel(model: 'assets/model_unquant.tflite',labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  pickImage() async{
    var image = await picker.pickImage(source: ImageSource.camera);
    if(image == null ) return null;
    setState(() {
      _image = File(image.path);
    });
    detectImage(_image);
  }

  pickGallery()async{
    var image = await picker.pickImage(source: ImageSource.gallery);
    if(image == null ) return null;
    setState(() {
      _image = File(image.path);
    });
    detectImage(_image);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x004242),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50,),
              Text(
                'El Thobhy',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
              SizedBox(height: 5,),
              Text(
                'Cat and dog classifier',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 50,),
              Center(
                child: _loading ? Container(
                  width: 350,
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/cat_and_dog.png',color: Colors.white,),
                      SizedBox(height: 50,),
                    ],
                  ),
                ) : Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        child: Image.file(_image),
                      ),
                      SizedBox(height: 5,),
                      _output != null ? Text('${_output[0]['label']}', style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                      ),) : Container(child: Text('Undefined',style: GoogleFonts.poppins(color: Colors.white),),),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        pickImage();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width -250,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Text(
                          'Capture of Photo',
                          style: GoogleFonts.poppins(
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    GestureDetector(
                      onTap: (){
                        pickGallery();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width -250,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 18),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Text(
                          'Select a Photo',
                          style: GoogleFonts.poppins(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}
