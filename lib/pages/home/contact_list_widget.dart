import 'dart:convert';

import 'package:flareline_uikit/components/forms/search_widget.dart';
import 'package:flareline_uikit/components/forms/select_widget.dart';
import 'package:flareline_uikit/components/image/image_widget.dart';
import 'package:flareline_uikit/components/tables/table_widget.dart';
import 'package:flareline_uikit/entity/table_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactListWidget extends TableWidget<ContactListViewModel> {
  @override
  // TODO: implement showPaging
  bool get showPaging => false;

  @override
  // TODO: implement showCheckboxColumn
  bool get showCheckboxColumn => true;

  @override
  // TODO: implement rowHeight
  double get rowHeight => 80;

  @override
  String title(BuildContext context) {
    // TODO: implement title
    return 'Contact List';
  }

  @override
  Widget? toolsWidget(BuildContext context, ContactListViewModel viewModel) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          const SizedBox(
            width: 280,
            child: SearchWidget(),
          ),
          const Spacer(),
          SizedBox(
            width: 200,
            child: SelectWidget(
              selectionList: const ['Alphabetic Order', 'Shawn', 'affwaw'],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget? customWidgetsBuilder(BuildContext context,
      TableDataRowsTableDataRows columnData, ContactListViewModel viewModel) {
    if ('firstName' == columnData.columnName) {
      return Row(
        children: [
          ImageWidget(
            imageUrl: columnData.data['avatar'],
            width: 60,
            height: 60,
            isCircle: true,
          ),
          SizedBox(
            width: 10,
          ),
          Text(columnData.data['name'])
        ],
      );
    }

    if('status' == columnData.columnName){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color:  Color(0xFFF2F6FF)
        ),
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
        child: Text(columnData.text??''),
      );
    }
    return null;
  }

  @override
  Widget? actionWidgetsBuilder(BuildContext context,
      TableDataRowsTableDataRows columnData, ContactListViewModel viewModel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          child: const Icon(
            Icons.more_horiz,
            size: 20,
          ),
        )
      ],
    );
  }

  @override
  ContactListViewModel viewModelBuilder(BuildContext context) {
    return ContactListViewModel(context);
  }
}

class ContactListViewModel extends BaseTableProvider {
  ContactListViewModel(super.context);

  @override
  loadData(BuildContext context) async {
    String res = await rootBundle.loadString('assets/crm/contactlist.json');

    Map<String, dynamic> map = json.decode(res);
    TableDataEntity tableDataEntity = TableDataEntity.fromJson(map);
    this.tableDataEntity = tableDataEntity;
  }
}
