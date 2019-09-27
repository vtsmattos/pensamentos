import 'package:flutter/material.dart';
import 'package:pensamento_form/src/sentimento/sentimento_module.dart';
import 'package:pensamento_form/src/shared/models/sentimento_model.dart';
import 'package:pensamento_form/src/shared/widgets/smiley.dart';

import '../../sentimento_bloc.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  double valueReange = 0;

  _getFeeling(valueReange){
    if(valueReange == 0){
      return "Feliz";
    }
    else if(valueReange > 0 && valueReange < 0.3){
      return "Normal";
    }
    else if(valueReange > 0.3 && valueReange < 0.51){
      return "Indiferente";
    }
    else if(valueReange > 0.5 && valueReange < 0.75){
      return "Triste";
    }
    else if(valueReange > 0.75){
      return "Raiva";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Como está se sentindo agora?"),
            Container(height: 10,),
            Container(
              height: 200,
              width: 200,
              child: Smiley( range: valueReange,),
            ),
            Container(height: 20,),
            Text(_getFeeling(valueReange),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.lerp(
                  Colors.blue,
                  Colors.red,
                  valueReange,
                ),
              ),
            ),
            Container(height: 10,),
            Slider(
              onChanged: (double value){
                setState(() {
                  valueReange = value;                  
                });
              },
              value: valueReange,
              min: 0,
              max: 1,
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                var model = SentimentoModule.to.bloc<SentimentoBloc>().model;
                model.sentimento = valueReange;
                model.title = _getFeeling(valueReange);
                SentimentoModule.to.bloc<SentimentoBloc>().pageController.jumpToPage(1);
              }, 
            child: Text(              
              "PRÓXIMO",
              style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
        ],
      ),
    );
  }
}
