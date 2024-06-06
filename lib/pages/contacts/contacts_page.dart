import 'package:flareline_crm/pages/crm_layout.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/forms/search_widget.dart';
import 'package:flareline_uikit/components/forms/select_widget.dart';
import 'package:flareline_uikit/components/tables/table_widget.dart';
import 'package:flareline_uikit/components/tags/tag_widget.dart';
import 'package:flareline_uikit/entity/table_data_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactsPage extends CrmLayout {
  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Contacts';
  }

  @override
  Widget breakTabRightWidget(BuildContext context) {
    // TODO: implement rightContentWidget
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 150,
          child: SelectWidget(
            selectionList: const ['This Month', 'This Week', 'This Year'],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 150,
          child: ButtonWidget(btnText: 'Add Contact +',type: ButtonType.primary.type,),
        )
      ],
    );
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ContactsTableWidget();
  }
}

class ContactsTableWidget extends TableWidget<ContactsViewModel> {
  @override
  // TODO: implement showCheckboxColumn
  bool get showCheckboxColumn => true;

  @override
  Widget toolsWidget(BuildContext context, ContactsViewModel viewModel) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: 260,
            child: SearchWidget(),
          ),
          Spacer(),
          _pageWidget(context)
        ],
      ),
    );
  }

  @override
  Widget? customWidgetsBuilder(BuildContext context,
      TableDataRowsTableDataRows columnData, ContactsViewModel viewModel) {
    if (columnData.columnName == 'leadScore') {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
                color: Color(0xFFF6FFF5),
                borderRadius: BorderRadius.circular(4)),
            child: TagWidget(
              color: Color(0xFF5ABE1C),
              text: columnData.text ?? '',
            ),
          )
        ],
      );
    }
    return null;
  }

  _pageWidget(BuildContext context) {
    return Row(
      children: [
        const Text('Showing'),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 80,
          height: 30,
          child: SelectWidget(selectionList: ['10', '20', '50']),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text('of'),
        const SizedBox(
          width: 5,
        ),
        const Text(
          '56',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text('of'),
        const SizedBox(
          width: 5,
        ),
        const Text('Results')
      ],
    );
  }

  @override
  ContactsViewModel viewModelBuilder(BuildContext context) {
    return ContactsViewModel(context);
  }
}

class ContactsViewModel extends BaseTableProvider {
  @override
  String get TAG => 'ContactsViewModel';

  ContactsViewModel(super.context);

  @override
  Future loadData(BuildContext context) async {
    const headers = [
      "Contact Name",
      "Last Contacted",
      "Company",
      "Contact",
      "Lead Score"
    ];

    List rows = [];

    for (int i = 0; i < 50; i++) {
      List<List<Map<String, dynamic>>> list = [];

      List<Map<String, dynamic>> row = [];
      var id = i;
      var item = {
        'contactName': 'Tom${id}',
        'lastContacted': '1 Feb, 2020',
        'company': 'Starbucks',
        'contact': 'nathan.roberts@example.com',
        'phone': '(201) 555-0124',
        'leadScore': 'Online store',
      };
      row.add(getItemValue('contactName', item));
      row.add(getItemValue('lastContacted', item));
      row.add(getItemValue('company', item));
      row.add(getItemValue('contact', item));
      row.add(
          getItemValue('leadScore', item, dataType: CellDataType.CUSTOM.type));
      list.add(row);

      rows.addAll(list);
    }

    Map<String, dynamic> map = {'headers': headers, 'rows': rows};
    TableDataEntity data = TableDataEntity.fromJson(map);
    tableDataEntity = data;
  }
}
