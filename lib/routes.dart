
import 'package:flareline_crm/deferred_widget.dart';
import 'package:flareline_crm/pages/auth/sign_in/sign_in_page.dart' deferred as signIn;
import 'package:flareline_crm/pages/auth/sign_up/sign_up_page.dart' deferred as signUp;
import 'package:flareline_crm/pages/contacts/contacts_page.dart' deferred as contacts;
import 'package:flareline_crm/pages/account/account_page.dart' deferred as account;
import 'package:flareline_crm/pages/deals/deals_page.dart' deferred as deals;
import 'package:flareline_crm/pages/task/task_page.dart' deferred as task;
import 'package:flareline_crm/pages/settings/user_settings_page.dart' deferred as userSettings;
import 'package:flareline_crm/pages/integrations/integrations_page.dart' deferred as integrations;
import 'package:flareline_crm/pages/report/report_page.dart' deferred as report;
import 'package:flareline_crm/pages/home/crm_home_page.dart';
import 'package:flutter/material.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

final List<Map<String, Object>> MAIN_PAGES = [
  {'routerPath': '/', 'widget': CrmHomePage()},
  {'routerPath': '/signIn', 'widget': DeferredWidget(signIn.loadLibrary, () => signIn.SignInPage())},
  {'routerPath': '/signUp', 'widget': DeferredWidget(signUp.loadLibrary, () => signUp.SignUpPage())},
  {'routerPath': '/contacts', 'widget': DeferredWidget(contacts.loadLibrary, () => contacts.ContactsPage())},
  {'routerPath': '/account', 'widget': DeferredWidget(account.loadLibrary, () => account.AccountPage())},
  {'routerPath': '/deals', 'widget': DeferredWidget(deals.loadLibrary, () => deals.DealsPage())},
  {'routerPath': '/task', 'widget': DeferredWidget(task.loadLibrary, () => task.TasksPage())},
  {'routerPath': '/userSettings', 'widget': DeferredWidget(userSettings.loadLibrary, () => userSettings.UserSettingsPage())},
  {'routerPath': '/integrations', 'widget': DeferredWidget(integrations.loadLibrary, () => integrations.IntegrationsPage())},
  {'routerPath': '/report', 'widget': DeferredWidget(report.loadLibrary, () => report.ReportPage())},
];

class RouteConfiguration {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>(debugLabel: 'Rex');

  static BuildContext? get navigatorContext =>
      navigatorKey.currentState?.context;

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    String path = settings.name!;

    dynamic map =
        MAIN_PAGES.firstWhere((element) => element['routerPath'] == path);

    if (map == null) {
      return null;
    }
    Widget targetPage = map['widget'];

    builder(context, match) {
      return targetPage;
    }

    return NoAnimationMaterialPageRoute<void>(
      builder: (context) => builder(context, null),
      settings: settings,
    );
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
