import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/widgets.dart';
import 'package:pensamento_form/src/shared/models/sentimento_model.dart';

class SentimentoBloc extends BlocBase {

  final SentimentoModel model = SentimentoModel();

  final PageController pageController = PageController();

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
