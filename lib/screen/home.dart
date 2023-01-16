import 'package:clone_heberlove/components/container_image.dart';
import 'package:clone_heberlove/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          const ContainerImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Herbalova',
                  style: GoogleFonts.playfairDisplay(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                  //style: GoogleFonts.pacifico(),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const Login()),
                          ));
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.green,
                      backgroundColor: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        'Sign to your account',
                        style: GoogleFonts.karla(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const FlutterLogo(
                  size: 100,
                  textColor: Colors.white,
                  style: FlutterLogoStyle.horizontal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
