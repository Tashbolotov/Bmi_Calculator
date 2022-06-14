import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget({Key key, this.onPressed, this.sliderValueText})
      : super(key: key);
  final Function(double value) onPressed;
  final int sliderValueText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff111327),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Height'.toUpperCase(),
              style: const TextStyle(fontSize: 25, letterSpacing: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  sliderValueText.toString(),
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'cm',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red,
                inactiveTrackColor: Colors.white,
                thumbColor: Colors.red,
                overlayColor: Colors.yellow,
              ),
              child: Slider(
                value: sliderValueText.toDouble(),
                max: 230,
                onChanged: onPressed,
              ),
            ),
            // CustomWidget(text: 'Weight',)
          ],
        ),
      ),
    );
  }
}
