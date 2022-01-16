import 'package:flutter/material.dart';
import 'package:testelogin/app/shared/models/data_model.dart';

class MyDataTable extends DataTableSource {
  MyDataTable(this.myData);
  final List<DataModel> myData;
  bool get isRowCountApproximate => false;
  int get rowCount => myData.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    var itemData = myData[index];
    return DataRow(
        cells: [
          DataCell(SelectableText((index + 1).toString())),
          DataCell(SelectableText(itemData.state.toString())),
          DataCell(SelectableText(itemData.confirmed.toString())),
          DataCell(SelectableText(itemData.deaths.toString())),
          DataCell(SelectableText('${(double.parse(itemData.deathRate.toString())).toStringAsFixed(2)}%')),
        ]
    );
  }

}