import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Buuton_Calculate extends StatelessWidget {
  const Buuton_Calculate({
    this.text,
    this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 100,
        color: Colors.red,
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

/// bul jakshy praktika emes
Expanded newMethod() {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xff111327),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const FaIcon(
            FontAwesomeIcons.mars,
            size: 75,
          ),
          Text(
            'male'.toUpperCase(),
            style: const TextStyle(fontSize: 25.0),
          ),
        ],
      ),
    ),
  );
}
