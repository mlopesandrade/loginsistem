import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testelogin/app/shared/utils/enums.dart';
import 'package:testelogin/app/shared/widgets/custom_text_field.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados Covid'),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: store.exitToApp,
        ),
      ),
      body: Observer(
        builder: (_){
          if(store.statusScreen == StatusScreen.loading)return const Center(child: CircularProgressIndicator(),);
          if(store.statusScreen == StatusScreen.error){
            return Center(
              child: Column(
                children: [
                  const Text('Erro ao buscar os dados.'),
                  ElevatedButton(
                    child: Text('Tente Novamente.'),
                    onPressed: store.init,
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                height: 120,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Data:'),
                        Container(
                          height: 60,
                          width: 120,
                          child: CustomTextFormField(
                            controller: store.date,
                            readOnly: true,
                            onTap: ()=>store.changeDate(context),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Estados:'),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            height: kIsWeb ? 48 : 58,
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: DropdownButton<String>(
                                underline: SizedBox(),
                                isExpanded: true,
                                value: store.state,
                                items: store.stateItems,
                                onChanged: (value)=>store.changeState(value),
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
              store.data.isEmpty ?
              const Expanded(
                child: Center(
                  child: Text('Sem Dados.'),
                ),
              ):
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: PaginatedDataTable(
                        header: Text('Dados do dia ${store.date.text}'),
                        rowsPerPage: controller.rowsPerPage,
                        dataRowHeight: 75,
                        availableRowsPerPage: [10,20,50,100],
                        columns: [
                          DataColumn(
                              label: Text('Id')
                          ),
                          DataColumn(
                              label: Text('Estado')
                          ),
                          DataColumn(
                              label: Text('Casos Confirmados')
                          ),
                          DataColumn(
                              label: Text('Número de mortes')
                          ),
                          DataColumn(
                              label: Text('Porcentagem de mortes')
                          )
                        ],
                        source: controller.myData!,
                      ),
                    )
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}