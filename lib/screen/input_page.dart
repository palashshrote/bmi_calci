import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../screen/results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../calculator_brain.dart';


enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weightData = 55, ageData = 21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                  cardChild: IconContent(
                    str:"Male",
                    ic: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                  cardChild: IconContent(
                    str:"Female",
                    ic: FontAwesomeIcons.venus,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Height',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: numTextStyle,),
                      Text('cm', style: labelTextStyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100.toDouble(),
                        max: 225.toDouble(),
                        activeColor: Colors.white,
                        thumbColor: bottomContainerColor,
                        inactiveColor: Colors.grey,
                        onChanged: (double newVal){
                          setState(() {
                            height = newVal.toInt();
                          });
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Weight', style: labelTextStyle,),
                      Text(weightData.toString(), style: numTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weightData--;
                              });
                            }
                          ),
                          SizedBox(width: 15.0,),
                          RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weightData++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: labelTextStyle,),
                      Text(ageData.toString(), style: numTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                ageData--;
                              });
                            },
                          ),
                          SizedBox(width: 15.0,),
                          RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                ageData++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),

                ),
              ),
            ],
          )),
          BottomButton(

            onTap: (){
              calculatorBrain calc = calculatorBrain(height: height, weight: weightData);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return ResultsPage(
                      bmi_result: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}





