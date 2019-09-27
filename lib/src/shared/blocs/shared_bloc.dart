import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pensamento_form/src/shared/models/sentimento_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class SharedBloc extends BlocBase {

  BehaviorSubject<List<SentimentoModel>> _listController =  BehaviorSubject.seeded([]);

  Observable<List<SentimentoModel>> get listOut => _listController.stream; 

  expurgar(){
    _listController.add([]);
  }

  addNovoSentimento(SentimentoModel sentimento){
    _listController.value.add(sentimento);
    _listController.add(_listController.value);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
