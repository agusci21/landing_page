import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: isOpen ? 308 : 50,
            color: Colors.black,
            child: Column(
              children: [
                _MenuTitle(isOpen: isOpen, controller: controller),
                if (isOpen) ...[
                  //Operador Spread = Si se cumple la condicion de injectan estos elementos a un arreglo
                  CustomMenuItem(
                    text: 'Home',
                    onPressed: () => pageProvider.goTo(0),
                    delay: 0,
                  ),
                  CustomMenuItem(
                    text: 'About',
                    onPressed: () => pageProvider.goTo(1),
                    delay: 100,
                  ),
                  CustomMenuItem(
                    text: 'Pricing',
                    onPressed: () => pageProvider.goTo(2),
                    delay: 200,
                  ),
                  CustomMenuItem(
                    text: 'Contact',
                    onPressed: () => pageProvider.goTo(3),
                    delay: 300,
                  ),
                  CustomMenuItem(
                    text: 'Location',
                    onPressed: () => pageProvider.goTo(4),
                    delay: 400,
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ]
              ],
            )),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 35 : 0,
          ),
          Text('Men??',
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
          const Spacer(),
          AnimatedIcon(
            progress: controller,
            icon: AnimatedIcons.menu_close,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
