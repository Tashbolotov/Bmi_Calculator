import 'package:bmi_calculator/brain/bmi_brain.dart';
import 'package:bmi_calculator/result_page.dart';

import 'package:bmi_calculator/widgets/custom_widget.dart';
import 'package:bmi_calculator/widgets/gender_widget.dart';
import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:bmi_calculator/widgets/weight_age_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/button_calculate.dart';

enum Gender {
  Male,
  Female,
  None,
}

class MainBmiPage extends StatefulWidget {
  const MainBmiPage({Key key}) : super(key: key);

  @override
  _MainBmiPageState createState() => _MainBmiPageState();
}

class _MainBmiPageState extends State<MainBmiPage> {
  double _sliderValue = 165;
  int _weight = 65;
  int _age = 25;
  Color _activeTus = Color.fromARGB(255, 130, 131, 151);
  Color _inActiveTus = Color(0xff111327);
  // bool _maelKnopka = false;
  // bool _femaleKnopka = false;00000000.
  Gender _gender = Gender.None;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  CustomWidget(
                    onTap: () {
                      setState(() {
                        // _femaleKnopka = true;
                        // _maelKnopka = !_maelKnopka;
                        _gender = Gender.Male;
                      });
                    },
                    // color: _maelKnopka == true ? _activeTus : _inActiveTus,
                    color: _gender == Gender.Male ? _activeTus : _inActiveTus,
                    widget: const GenderWidget(
                        icons: FontAwesomeIcons.mars, text: 'MALE'),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  CustomWidget(
                    onTap: () {
                      setState(() {
                        // _femaleKnopka = true;
                        // _femaleKnopka = !_femaleKnopka;
                        _gender = Gender.Female;
                      });
                    },
                    // color: _femaleKnopka == true ? _activeTus : _inActiveTus,
                    color: _gender == Gender.Female ? _activeTus : _inActiveTus,
                    widget: const GenderWidget(
                        icons: FontAwesomeIcons.venus, text: 'Female'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomWidget(
              widget: HeightWidget(
                  onPressed: (double ozgorgonData) {
                    setState(() {
                      _sliderValue = ozgorgonData;
                    });
                  },
                  sliderValueText: _sliderValue.toInt()),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Row(
                children: [
                  CustomWidget(
                    widget: WeightAgeWidget(
                        minus: () {
                          setState(() {
                            _weight--;
                          });
                        },
                        plus: () {
                          setState(() {
                            _weight++;
                          });
                        },
                        soz: 'weght',
                        ekinchiSoz: _weight.toString()),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  CustomWidget(
                    widget: WeightAgeWidget(
                        minus: () {
                          setState(() {
                            _age--;
                          });
                        },
                        plus: () {
                          setState(() {
                            _age++;
                          });
                        },
                        soz: 'age',
                        ekinchiSoz: _age.toString()),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
      bottomNavigationBar: Buuton_Calculate(
        text: 'Calculate',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => ResultPage(
                    bmiResult: bmiBrain.calculateBrain(_weight, _age),
                  )),
            ),
          );
        },
      ),
    );
  }
}


//// Turnay operator ===>> _melKnopka == ture ? _activTus:_inActivTus
/// if (_melKnopka == ture){
/// _inactivTus;
/// }else{
/// _inActivTus
/// }
/// 