import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
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
                ) : Container(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){},
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
                      onTap: (){},
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
