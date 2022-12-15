import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';


class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmi_result, this.resultText, this.interpretation});

  final String bmi_result;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calci'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your result',
                style: kTitleTextStyle,
              ),
              // color: activeCardColor,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmi_result,
                    style: kBmiTextStyle,

                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),

          BottomButton(
            onTap: (){
              Navigator.pop(context);
            },
            buttonTitle: 'Re-CALCULATE',
          ),
        ],
      ),

    );
  }
}
