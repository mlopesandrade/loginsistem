import 'package:mobx/mobx.dart';
import 'package:testelogin/app/shared/models/data_model.dart';
import 'app_repository.dart';
part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;
abstract class _AppStoreBase with Store {

  String nextPage = '';

  String lastPage = '';

  AppRepository _appRepository;
  _AppStoreBase(this._appRepository);

  getData(String date,String state)async{
    var data = await _appRepository.getData(date,state);
    if(data['next'] != null){
      nextPage = data['next'];
    }
    if(data['results'] != null){
      return data['results'].map((x){
        return DataModel.fromJson(x);
      }).toList();
    }else{
      return [];
    }
  }

  getNextData(String link)async{
    return await _appRepository.getNextData(link);
  }

}