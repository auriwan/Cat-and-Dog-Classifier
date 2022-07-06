import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cat_dog_classifier/home.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds:2,
      navigateAfterSeconds: Home(),
      title: Text(
        'Cat and Dog Classifier',
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.grey
          ),
        )
      ),
      image: Image.asset('assets/cat_and_dog.png'),
      backgroundColor: Colors.blue,
      photoSize: 100,
      loaderColor: Colors.white,
    );
  }
}
