import 'package:flareline_crm/pages/crm_layout.dart';
import 'package:flareline_crm/pages/home/contact_list_widget.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountPage extends CrmLayout {
  const AccountPage({super.key});

  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Accounts';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ContactListWidget(
      showTitle: false,
      showPage: true,
      json: 'assets/crm/contactlistall.json',
    );
  }
}
