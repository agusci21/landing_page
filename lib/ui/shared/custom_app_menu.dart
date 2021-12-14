import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          print('Click');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 50,
          color: Colors.black,
          child: Row(
            children: [
              Text('Menú',
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
              const Spacer(),
              const Icon(
                Icons.menu,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
