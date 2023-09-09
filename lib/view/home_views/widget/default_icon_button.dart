import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultIconButton extends StatelessWidget {
const DefaultIconButton({super.key, required this.onTap, required this.icon, required this.nameIcon});
final VoidCallback onTap;
final String icon;
final String nameIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: 60.0,
          ),
          Text(nameIcon,),
        ],

      ),
    );
  }
}
