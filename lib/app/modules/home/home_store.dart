import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:testelogin/app/app_store.dart';
import 'package:testelogin/app/auth/auth_store.dart';
import 'package:testelogin/app/shared/models/data_model.dart';
import 'package:testelogin/app/shared/utils/data_source.dart';
import 'package:testelogin/app/shared/utils/enums.dart';
import 'package:intl/intl.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  final List<DropdownMenuItem<String>> stateItems = [
    const DropdownMenuItem(
      value: '',
      child: Text('Todos'),
    ),
    const DropdownMenuItem(
      value: 'AC',
      child: Text('Acre'),
    ),
    const DropdownMenuItem(
      value: 'AL',
      child: Text('Alagoas'),
    ),
    const DropdownMenuItem(
      value: 'AP',
      child: Text('Amapá'),
    ),
    const DropdownMenuItem(
      value: 'AM',
      child: Text('Amazonas'),
    ),
    const DropdownMenuItem(
      value: 'BA',
      child: Text('Bahia'),
    ),
    const DropdownMenuItem(
      value: 'CE',
      child: Text('Ceará'),
    ),
    const DropdownMenuItem(
      value: 'DF',
      child: Text('Distrito Federal'),
    ),
    const DropdownMenuItem(
      value: 'ES',
      child: Text('Espírito Santo'),
    ),const DropdownMenuItem(
      value: 'GO',
      child: Text('Goiás'),
    ),
    const DropdownMenuItem(
      value: 'MA',
      child: Text('Maranhão'),
    ),
    const DropdownMenuItem(
      value: 'MT',
      child: Text('Mato Grosso'),
    ),const DropdownMenuItem(
      value: 'MS',
      child: Text('Mato Grosso do Sul'),
    ),
    const DropdownMenuItem(
      value: 'MG',
      child: Text('Minas Gerais'),
    ),
    const DropdownMenuItem(
      value: 'PA',
      child: Text('Pará'),
    ),
    const DropdownMenuItem(
      value: 'PB',
      child: Text('Paraíba'),
    ),
    const DropdownMenuItem(
      value: 'PR',
      child: Text('Paraná'),
    ),
    const DropdownMenuItem(
      value: 'PE',
      child: Text('Pernambuco'),
    ),
    const DropdownMenuItem(
      value: 'PI',
      child: Text('Piauí'),
    ),
    const DropdownMenuItem(
      value: 'RJ',
      child: Text('Rio de Janeiro'),
    ),
    const DropdownMenuItem(
      value: 'RN',
      child: Text('Rio Grande do Norte'),
    ),
    const DropdownMenuItem(
      value: 'RS',
      child: Text('Rio Grande do Sul'),
    ),
    const DropdownMenuItem(
      value: 'RO',
      child: Text('Rondônia'),
    ),
    const DropdownMenuItem(
      value: 'RR',
      child: Text('Roraima'),
    ),
    const DropdownMenuItem(
      value: 'SC',
      child: Text('Santa Catarina'),
    ),
    const DropdownMenuItem(
      value: 'SP',
      child: Text('São Paulo'),
    ),
    const DropdownMenuItem(
      value: 'SE',
      child: Text('Sergipe'),
    ),
    const DropdownMenuItem(
      value: 'TO',
      child: Text('Tocantins'),
    )
  ];

  DataTableSource? myData;

  @observable
  int rowsPerPage = 10;

  @observable
  String state = '';

  TextEditingController date = TextEditingController();

  @observable
  StatusScreen statusScreen = StatusScreen.initial;

  @observable
  ObservableList<DataModel> data = ObservableList<DataModel>();

  AppStore appStore;
  AuthStore authStore;
  HomeStoreBase(this.appStore,this.authStore){
    date.text = DateFormat('dd/MM/yyyy').format(DateTime.now().subtract(Duration(days: 1)));
    init();
  }

  exitToApp()async{
    await authStore.signOut();
    Modular.to.pushNamedAndRemoveUntil('/login', (p0) => true);
  }

  setStatusScreen(StatusScreen status)=> statusScreen = status;

  init()async{
    try{
      setStatusScreen(StatusScreen.loading);
      var response = await appStore.getData(date.text,state);
      if(response != null){
        data.clear();
        response.forEach((x)=>data.add(x));
        myData = MyDataTable(data);
        setStatusScreen(StatusScreen.ok);
      }else{
        setStatusScreen(StatusScreen.error);
      }
    }catch(e){
      setStatusScreen(StatusScreen.error);
    }
  }

  changeDate(BuildContext context)async{
    await showDatePicker(
        context: context,
        initialDate: DateTime.now().subtract(Duration(days: 1)),
        firstDate: DateTime(2016),
        lastDate: DateTime.now().subtract(Duration(days: 1)),
    ).then((value) {
      if(value != null){
        date.text = DateFormat('dd/MM/yyyy').format(value);
        init();
      }
    });
  }

  changeState(String? value){
    if(value != null){
      state = value;
      init();
    }
  }
}